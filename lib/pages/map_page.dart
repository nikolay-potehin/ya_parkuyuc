import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';
import 'package:ya_parkuyuc/src/providers/points_provider.dart';
import 'package:ya_parkuyuc/src/widgets/map_loading_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    //   mapController = MapController.customLayer(
    //     initPosition: GeoPoint(latitude: 56.8319, longitude: 60.6122),
    //     customTile: CustomTile(
    //       tileSize: 256,
    //       sourceName: '{z}/{x}/{y}',
    //       tileExtension: '.png',
    //       urlsServers: [
    //         TileURLs(url: 'https://api.maptiler.com/maps/dataviz/256/'),
    //       ],
    //       keyApi: const MapEntry(
    //         'key',
    //         'SSoI3cnrsx94qEmtEQ4l',
    //       ),
    //     ),
    //   );
    mapController = MapController.withPosition(
      initPosition: GeoPoint(latitude: 56.8319, longitude: 60.6122),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(
        mapIsLoading: const MapLoadingWidget(),
        onMapIsReady: (isReady) {
          if (isReady) _initMarkers();
        },
        controller: mapController,
        osmOption: OSMOption(
          zoomOption: const ZoomOption(
            initZoom: 12,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          staticPoints: context.read<PointsProvider>().getStaticPoints(),
          showContributorBadgeForOSM: true,
        ),
        onGeoPointClicked: (point) {
          final geoObject = context.read<PointsProvider>().getObject(point);
          geoObject?.onClicked(context);
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'zoomIn',
            onPressed: () => mapController.zoomIn(),
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'zoomOut',
            onPressed: () => mapController.zoomOut(),
            child: const Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }

  _initMarkers() {
    mapController.addMarker(GeoPoint(latitude: 56.8319, longitude: 60.6272),
        markerIcon: const MarkerIcon(
          icon: Icon(Icons.man, size: 60, color: Colors.white),
        ));
    mapController.addMarker(
      GeoPoint(latitude: 56.8319, longitude: 60.5972),
      markerIcon: const MarkerIcon(
        iconWidget: Icon(Icons.man, size: 60, color: Colors.white),
      ),
    );
  }
}
