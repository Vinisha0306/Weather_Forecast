import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_forecast/Helper/SearchHelper.dart';
import 'package:weather_forecast/Modal/searchModal.dart';

class SearchCityController extends GetxController {
  RxList<Search> allSearch = <Search>[].obs;

  Future<void> initData([city = 'surat']) async {
    allSearch(await SearchHelper.searchHelper.getSearch(city: city));
    Logger().i('api calling');
  }
}
