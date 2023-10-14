import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ya_parkuyuc/pages/parking_page.dart';
import 'package:ya_parkuyuc/src/models/geo_objects/geo_object.dart';
import 'package:ya_parkuyuc/src/widgets/markers/parking_marker.dart';

class ParkingGeoObject extends GeoObject {
  ParkingGeoObject(String name)
      : super(name, MarkerIcon(iconWidget: ParkingMarker(name: name)));

  @override
  void onClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ParkingPage(parkingName: name),
    ));
  }
}
