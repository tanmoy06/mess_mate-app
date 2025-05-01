import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPageController extends GetxController {
  Rx<LatLng?> userLocation = Rx<LatLng?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUserLocation();
  }

  Future<void> fetchUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      print("Location services enabled: $serviceEnabled");

      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        print("Location services are disabled. Open settings.");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      print("Location permission status: $permission");

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        print("Requested location permission: $permission");

        if (permission != LocationPermission.always &&
            permission != LocationPermission.whileInUse) {
          print("Location permission denied");
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Print the user's location to the console
      print(
        'User Location: Latitude: ${position.latitude}, Longitude: ${position.longitude}',
      );

      userLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error fetching location: $e");
    }
  }
}
