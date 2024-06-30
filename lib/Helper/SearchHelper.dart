import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/Modal/searchModal.dart';

class SearchHelper {
  SearchHelper._();

  static final SearchHelper searchHelper = SearchHelper._();

  String Api =
      'https://api.geoapify.com/v1/geocode/search?apiKey=47b76baa281d4b6498b3664d8a6b72db';

  Future<List<Search>> getSearch({required city}) async {
    List<Search> allData = [];

    http.Response response = await http.get(Uri.parse('$Api&city=$city'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['features'];
      allData = data.map((e) => Search.fromJson(e)).toList();
    }
    Logger().i(response.statusCode);

    return allData;
  }
}
