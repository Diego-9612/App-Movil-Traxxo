import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerState.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/GooglePlacesAutoComplete.dart';

class ClientMapSeekerPage extends StatefulWidget {
  const ClientMapSeekerPage({super.key});

  @override
  State<ClientMapSeekerPage> createState() => _ClientMapSeekerPageState();
}

class _ClientMapSeekerPageState extends State<ClientMapSeekerPage> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController pickUpController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ClientMapSeekerBloc>().add(ClientMapSeekerInitEvent());
      context.read<ClientMapSeekerBloc>().add(FindPosition());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClientMapSeekerBloc, ClientMapSeekerState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: state.cameraPosition,
                markers: Set<Marker>.of(state.markers.values),
                onCameraMove: (CameraPosition cameraPosition) {
                  context.read<ClientMapSeekerBloc>().add(
                    onCameraMove(cameraPosition: cameraPosition),
                  );
                },
                onCameraIdle: () async {
                  context.read<ClientMapSeekerBloc>().add(onCameraIdle());
                  pickUpController.text = state.placemarkData?.address ?? '';
                },

                onMapCreated: (GoogleMapController controller) {
                  controller.setMapStyle(
                    '[ { "elementType": "geometry", "stylers": [ { "color": "#212121" } ] }, { "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#212121" } ] }, { "featureType": "administrative", "elementType": "geometry", "stylers": [ { "color": "#757575" } ] }, { "featureType": "administrative.country", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] }, { "featureType": "administrative.land_parcel", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.locality", "elementType": "labels.text.fill", "stylers": [ { "color": "#bdbdbd" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "color": "#181818" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "poi.park", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1b1b1b" } ] }, { "featureType": "road", "elementType": "geometry.fill", "stylers": [ { "color": "#2c2c2c" } ] }, { "featureType": "road", "elementType": "labels.text.fill", "stylers": [ { "color": "#8a8a8a" } ] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [ { "color": "#373737" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#3c3c3c" } ] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry", "stylers": [ { "color": "#4e4e4e" } ] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "transit", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#000000" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#3d3d3d" } ] } ]',
                  );
                  if (!state.controller!.isCompleted) {
                    state.controller?.complete(controller);
                  }
                },
              ),
              Container(
                height: 110,
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Card(
                  surfaceTintColor: Colors.white,
                  child: Column(
                    children: [
                      GooglePlacesAutoComplete(
                        pickUpController,
                        'Lugar de Carga',
                        (Prediction prediction) {
                          if (prediction != null) {
                            context.read<ClientMapSeekerBloc>().add(
                              ChangeMapCameraPosition(
                                lat: double.parse(prediction.lat!),
                                lng: double.parse(prediction.lng!),
                              ),
                            );
                          }
                          print('Luagr de recogida lat: ${prediction.lat}');
                          print('Luagr de recogida lng: ${prediction.lng}');
                        },
                      ),
                      //SizedBox(height:15),
                      GooglePlacesAutoComplete(
                        destinationController,
                        'Destino final',
                        (Prediction prediction) {
                          print('Luagr de recogida lat: ${prediction.lat}');
                          print('Luagr de recogida lng: ${prediction.lng}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              _iconMyLocation(),
            ],
          );
        },
      ),
    );
  }

  Widget _iconMyLocation() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      alignment: Alignment.center,
      child: Image.asset('assets/img/location_blue.png', width: 55, height: 55),
    );
  }
}
