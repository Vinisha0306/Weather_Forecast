import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LiveLocationController extends GetxController {
  Position? position;

  Future<void> getCurrentLocation() async {
    position = await _determinePosition();
    update();
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
