import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/WeatherHelper.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';
import 'package:weather_forecast/controller/locationController.dart';

import 'liveLocationController.dart';

class WeatherController extends GetxController {
  RxList<Weather> allWeather = <Weather>[].obs;
  LiveLocationController liveLocationController =
      Get.find<LiveLocationController>();
  LocationController locationController = Get.put(LocationController());

  WeatherController() {
    initData();
  }

  Future<void> initData() async {
    await liveLocationController.getCurrentLocation();
    locationController.initData(
      liveLocationController.position?.latitude,
      liveLocationController.position?.longitude,
    );
    allWeather(
      await WeatherHelper.weatherHelper.getAllWeather(
        lat: liveLocationController.position?.latitude,
        lon: liveLocationController.position?.longitude,
      ),
    );
    Logger().i(allWeather);
  }

  double temp(int index) {
    double data = (allWeather[index].main.temp - 273.15);
    return data;
  }
}
