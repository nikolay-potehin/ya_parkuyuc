import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ya_parkuyuc/src/models/geo_objects/geo_object.dart';
import 'package:ya_parkuyuc/src/models/geo_objects/parking_geo_object.dart';
import 'package:ya_parkuyuc/src/models/geo_objects/user_location_geo_object.dart';

class PointsProvider {
  final Map<GeoPoint, GeoObject> _staticPoints = {
    GeoPoint(latitude: 56.8159, longitude: 60.5922):
        ParkingGeoObject('Ул. Большой Ржаки'),
    GeoPoint(latitude: 56.8419, longitude: 60.5822):
        ParkingGeoObject('Угарная парковка'),
    GeoPoint(latitude: 56.8259, longitude: 60.6372):
        ParkingGeoObject('Прикольный ТЦ'),
    GeoPoint(latitude: 56.8319, longitude: 60.6122): UserLocationGeoObject(),
  };

  GeoObject? getObject(GeoPoint point) => _staticPoints[point];

  List<StaticPositionGeoPoint> getStaticPoints() {
    final result = <StaticPositionGeoPoint>[];

    _staticPoints.forEach((point, object) {
      result.add(StaticPositionGeoPoint(
        object.name,
        object.markerIcon,
        [point],
      ));
    });

    return result;
  }
}
