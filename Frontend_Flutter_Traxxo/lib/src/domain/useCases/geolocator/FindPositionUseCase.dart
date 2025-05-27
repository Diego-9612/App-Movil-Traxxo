import 'package:transporte_carga_flutter/src/domain/repository/GeolocatorRepository.dart';

class FindPositionUseCase {

  GeolocatorRepository geolocatorRepository;

  FindPositionUseCase(this.geolocatorRepository);

  run() => geolocatorRepository.findPosition();
}