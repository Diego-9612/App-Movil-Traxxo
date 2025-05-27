import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transporte_carga_flutter/src/domain/models/PlacemarkData.dart';

abstract class GeolocatorRepository {

  Future<Position> findPosition();
  Future<BitmapDescriptor> createMarketFromAsset(String path);
  Marker getMarker(
    String markerId,
    double lat,
    double lng,
    String title,
    String content,
    BitmapDescriptor imageMarker
  );
  Future<PlacemarkData?> getPlacemarkData(CameraPosition cameraPosition);
}