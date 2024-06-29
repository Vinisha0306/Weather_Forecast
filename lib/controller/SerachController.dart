import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/LocationHelper.dart';
import 'package:weather_forecast/Helper/SearchHelper.dart';
import 'package:weather_forecast/Helper/WeatherHelper.dart';
import 'package:weather_forecast/Modal/LocationModal.dart';
import 'package:weather_forecast/Modal/WeatherModal.dart';
import 'package:weather_forecast/Modal/searchModal.dart';

class SearchController extends GetxController {
  RxList<SearchModal> allSearch = <SearchModal>[].obs;

  SearchController() {
    initData();
  }

  Future<void> initData([city = 'surat']) async {
    allSearch.add((await SearchHelper.weatherHelper.getSearch(city: city))
        as SearchModal);

    Logger().i(allSearch);
  }
}
