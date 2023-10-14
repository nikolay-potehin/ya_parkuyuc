import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ya_parkuyuc/src/models/geo_objects/geo_object.dart';
import 'package:ya_parkuyuc/src/widgets/markers/user_location_marker.dart';

class UserLocationGeoObject extends GeoObject {
  UserLocationGeoObject()
      : super('Ваша Локация',
            const MarkerIcon(iconWidget: MyUserLocationMarker()));

  @override
  void onClicked(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Это ваше местоположение', style: TextStyle(fontSize: 17)),
      duration: Duration(milliseconds: 1500),
    ));
  }
}
