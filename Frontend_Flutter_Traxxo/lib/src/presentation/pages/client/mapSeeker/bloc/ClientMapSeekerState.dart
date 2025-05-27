import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transporte_carga_flutter/src/domain/models/PlacemarkData.dart';

class ClientMapSeekerState extends Equatable {

  final Completer<GoogleMapController>? controller;
  final Position? position;
  final CameraPosition cameraPosition;
  final PlacemarkData? placemarkData;
  final Map<MarkerId, Marker> markers;

  ClientMapSeekerState({
    this.position,
    this.controller,
    this.cameraPosition = const CameraPosition(target: LatLng(1.2301142, -77.2908582), zoom: 14.0),
    this.placemarkData,
    this.markers = const <MarkerId, Marker>{}
  });

  ClientMapSeekerState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    CameraPosition? cameraPosition,
    PlacemarkData? placemarkData,
    Map<MarkerId, Marker>? markers

  }) {
    return ClientMapSeekerState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      placemarkData: placemarkData ?? this.placemarkData
    );
  }
  
  @override
  List<Object?> get props => [position, markers, controller, cameraPosition, placemarkData];
  
}