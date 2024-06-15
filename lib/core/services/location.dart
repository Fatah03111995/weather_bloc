import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Location({required this.latitude, required this.longitude});

  static Future<Location> getCurrentData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    try {
      if (permission != LocationPermission.whileInUse ||
          permission != LocationPermission.always) {
        await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      return Location(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      throw e.toString();
    }
  }
}
