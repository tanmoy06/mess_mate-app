import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/map_page_controller.dart';

class MapPageView extends GetView<MapPageController> {
  const MapPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final location = controller.userLocation.value;
        if (location == null) {
          return Center(child: CircularProgressIndicator());
        }
        return FlutterMap(
          options: MapOptions(initialCenter: location, initialZoom: 15.0),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: location,
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                // Sample provider marker
                Marker(
                  point: LatLng(
                    location.latitude + 0.001,
                    location.longitude + 0.001,
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Icon(Icons.store, color: Colors.green, size: 40),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
