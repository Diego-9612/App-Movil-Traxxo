import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ClientMapSeekerEvent {}

class ClientMapSeekerInitEvent extends ClientMapSeekerEvent {}

class FindPosition extends ClientMapSeekerEvent {}

class ChangeMapCameraPosition extends ClientMapSeekerEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class onCameraMove extends ClientMapSeekerEvent{
  CameraPosition cameraPosition;

  onCameraMove({required this.cameraPosition});
}

class onCameraIdle extends ClientMapSeekerEvent{}
