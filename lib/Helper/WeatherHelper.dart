import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';
import 'package:http/http.dart' as http;

class WeatherHelper {
  WeatherHelper._();

  static final WeatherHelper weatherHelper = WeatherHelper._();

  String Api =
      'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=c8933f911806cbe21cd4f700b00fc081';

  Future<List<Weather>> getAllWeather({required lat, required lon}) async {
    List<Weather> allData = [];

    http.Response response =
        await http.get(Uri.parse('$Api&lat=$lat&lon=$lon'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['list'];
      allData = data.map((e) => Weather.fromJson(e)).toList();
    }
    Logger().i(response.statusCode);

    return allData;
  }
}
