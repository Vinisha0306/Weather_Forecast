import 'dart:async';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/WeatherHelper.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';
import 'package:weather_forecast/controller/SerachController.dart';
import 'liveLocationController.dart';

class WeatherController extends GetxController {
  RxList<Weather> allWeather = <Weather>[].obs;
  RxList<Weather> allSearchWeather = <Weather>[].obs;
  LiveLocationController liveLocationController =
      Get.find<LiveLocationController>();
  SearchCityController searchCityController = Get.put(SearchCityController());

  WeatherController() {
    initData();
  }

  Future<void> initData() async {
    await liveLocationController.getCurrentLocation();

    allWeather(
      await WeatherHelper.weatherHelper.getAllWeather(
        lat: liveLocationController.position?.latitude,
        lon: liveLocationController.position?.longitude,
      ),
    );
    Logger().i(allWeather);
  }

  Future<void> searchData() async {
    allSearchWeather(
      await WeatherHelper.weatherHelper.getAllWeather(
        lat: searchCityController.allSearch[0].properties.lat,
        lon: searchCityController.allSearch[0].properties.lon,
      ),
    );
  }

  double temp(int index) {
    double data = (allWeather[index].main.temp - 273.15);
    return data;
  }

  double searchTemp(int index) {
    double data = (allSearchWeather[index].main.temp - 273.15);
    return data;
  }
}
