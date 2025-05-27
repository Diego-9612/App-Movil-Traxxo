import 'package:transporte_carga_flutter/src/domain/repository/GeolocatorRepository.dart';

class CreateMarkerUseCase {

  GeolocatorRepository geolocatorRepository;
  CreateMarkerUseCase(this.geolocatorRepository);
  run(String path) => geolocatorRepository.createMarketFromAsset(path);
}