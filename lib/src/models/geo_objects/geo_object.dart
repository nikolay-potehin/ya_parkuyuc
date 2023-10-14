import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

abstract class GeoObject {
  final String name;
  final MarkerIcon markerIcon;

  GeoObject(this.name, this.markerIcon);

  void onClicked(BuildContext context);
}
