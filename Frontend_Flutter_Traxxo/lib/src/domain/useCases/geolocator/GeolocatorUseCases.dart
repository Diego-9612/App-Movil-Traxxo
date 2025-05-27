import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GetPlacemarkDataUseCase.dart';

class GeolocatorUseCases {

  FindPositionUseCase findPosition;
  CreateMarkerUseCase createMarker;
  GetMarkerUseCase getMarker;
  GetPlacemarkDataUseCase getPlacemarkData;

  GeolocatorUseCases({
    required this.findPosition,
    required this.createMarker,
    required this.getMarker,
    required this.getPlacemarkData});
}