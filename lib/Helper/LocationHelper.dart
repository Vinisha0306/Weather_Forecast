import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:weather_forecast/Modal/LocationModal.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  LocationHelper._();

  static final LocationHelper locationHelper = LocationHelper._();

  String Api =
      'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=c8933f911806cbe21cd4f700b00fc081';

  Future<Location> getLocation({required lat, required lon}) async {
    Location allData = Location(
        id: 0,
        name: 'name',
        coord: Coord(
          lat: 0,
          lon: 0,
        ),
        country: 'country',
        population: 0,
        timezone: 0,
        sunrise: 0,
        sunset: 0);

    http.Response response =
        await http.get(Uri.parse('$Api&lat=$lat&lon=$lon'));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body)['city'];
      allData = Location.fromJson(data as Map<String, dynamic>);
    }
    Logger().i(response.statusCode);

    return allData;
  }
}
