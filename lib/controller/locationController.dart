import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/LocationHelper.dart';
import 'package:weather_forecast/Helper/WeatherHelper.dart';
import 'package:weather_forecast/Modal/LocationModal.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';

class LocationController extends GetxController {
  RxList<Location> allLocation = <Location>[].obs;

  LocationController() {
    initData();
  }

  Future<void> initData([lat, lon]) async {
    allLocation.add(
        await LocationHelper.locationHelper.getLocation(lat: lat, lon: lon));

    Logger().i(allLocation);
  }
}
