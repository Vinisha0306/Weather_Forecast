import 'package:get/get.dart';
import 'package:weather_forecast/Helper/favoriteDatabase.dart';
import 'package:weather_forecast/Modal/favoriteDatabaseModal.dart';

class FavoriteDatabaseController extends GetxController {
  RxList<FavoriteModal> allFavorite = <FavoriteModal>[].obs;

  FavoriteDatabaseController() {
    init();
  }

  Future<void> init() async {
    await FavoriteDatabase.favoriteDatabase.init();
    allFavorite(await FavoriteDatabase.favoriteDatabase.getAllData());
  }

  Future<void> addFavorite({required FavoriteModal favorite}) async {
    await FavoriteDatabase.favoriteDatabase.insertData(favorite: favorite);
    init();
  }

  Future<void> removeFavorite({required String city}) async {
    await FavoriteDatabase.favoriteDatabase.deleteData(city: city);
    init();
  }
}
