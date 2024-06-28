import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/WeatherHelper.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';

class WeatherController extends GetxController {
  RxList<Weather> allWeather = <Weather>[].obs;

  WeatherController() {
    initData();
  }

  Future<void> initData({lat = 21.1, lon = 72.8}) async {
    allWeather(
      await WeatherHelper.weatherHelper.getAllWeather(lat: lat, lon: lon),
    );
    Logger().i(allWeather);
  }
}
