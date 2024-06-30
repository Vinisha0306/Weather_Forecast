import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_forecast/Modal/favoriteDatabaseModal.dart';

enum Favorite { id, city, isFavorite }

class FavoriteDatabase {
  FavoriteDatabase._();
  static final FavoriteDatabase favoriteDatabase = FavoriteDatabase._();
  String dbName = "my_dataBase";
  String tableName = "FavoriteCity";

  late Database database;
  late String sql;

  Future<void> init() async {
    String path = await getDatabasesPath();

    database = await openDatabase(
      '$path/$tableName',
      version: 2,
      onUpgrade: (db, v, v1) {
        String query =
            """create table if not exists $tableName(${Favorite.id.name} integer primary key autoincrement,
            ${Favorite.city.name} text unique,
            ${Favorite.isFavorite.name} boolean not null)""";

        db
            .execute(query)
            .then(
              (value) => Logger().i('table created'),
            )
            .onError(
              (error, stackTrace) => Logger().e('error : $error}'),
            );
      },
    );
  }

  Future<void> insertData({required FavoriteModal favorite}) async {
    sql =
        "insert into $tableName(${Favorite.city.name},${Favorite.isFavorite.name}) values(?,?)";
    List args = [
      favorite.city,
      favorite.isFavorite,
    ];
    await database
        .rawInsert(sql, args)
        .then(
          (value) => Logger().i('inserted'),
        )
        .onError(
          (error, stackTrace) => Logger().e('Error : $error'),
        );
    ;
  }

  Future<void> deleteData({required String city}) async {
    await database
        .delete(
          tableName,
          where: "city=?",
          whereArgs: [city],
        )
        .then(
          (value) => Logger().i('Deleted'),
        )
        .onError(
          (error, stackTrace) => Logger().e('Error : $error'),
        );
  }

  Future<List<FavoriteModal>> getAllData() async {
    List<FavoriteModal> allFavorite = [];

    sql = "select * from $tableName;";
    List Data = await database.rawQuery(sql);
    allFavorite = Data.map((e) => FavoriteModal.formMap(data: e)).toList();

    return allFavorite;
  }
}
