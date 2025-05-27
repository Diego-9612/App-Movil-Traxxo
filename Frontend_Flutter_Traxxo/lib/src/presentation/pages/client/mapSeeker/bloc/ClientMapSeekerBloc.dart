import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transporte_carga_flutter/src/domain/models/PlacemarkData.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerState.dart';

class ClientMapSeekerBloc
    extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<ClientMapSeekerInitEvent>((event, emit) {
      Completer<GoogleMapController> controller = Completer<GoogleMapController>();
      emit(state.copyWith(controller: controller));
    });
    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();
      add(ChangeMapCameraPosition(lat: position.latitude, lng: position.longitude));
      /*BitmapDescriptor imageMarker = await geolocatorUseCases.createMarker.run('assets/img/location_blue.png');
      Marker marker = geolocatorUseCases.getMarker.run(
        'MyLocation',
        position.latitude,
        position.longitude,
        'Mi Posicion',
        '',
        imageMarker
      );*/
      emit(
        state.copyWith(
          position: position, 
          /*markers: {
            marker.markerId: marker
          },*/
        )
      );
      print('position lat: ${position.latitude}');
      print('position lon: ${position.longitude}');
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0 ),
        ),
      );
    });

    on<onCameraMove>((event, emit) {
      emit(
        state.copyWith(
          cameraPosition: event.cameraPosition
        )
      );
    });

    on<onCameraIdle>((event, emit) async {
      PlacemarkData placemarkData = await geolocatorUseCases.getPlacemarkData.run(state.cameraPosition);
      emit(
        state.copyWith(
          placemarkData: placemarkData
        )
      );
      
    });
  }
}
