import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/Modal/favoriteDatabaseModal.dart';
import 'package:weather_forecast/controller/FavoriteDatabaseController.dart';
import 'package:weather_forecast/controller/SerachController.dart';
import 'package:weather_forecast/controller/themeController.dart';
import 'package:weather_forecast/extension.dart';
import '../../controller/WeatherController.dart';

String? city;

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  ThemeController themeController = Get.find<ThemeController>();
  WeatherController weatherController = Get.put(WeatherController());
  SearchCityController searchController = Get.put(SearchCityController());
  FavoriteDatabaseController favoriteDatabaseController =
      Get.put(FavoriteDatabaseController());
  bool list = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.ChangeTheme();
                themeController.isdark.value
                    ? Get.changeTheme(ThemeData.dark())
                    : Get.changeTheme(ThemeData.light());
              },
              icon: Icon(
                themeController.isdark.value
                    ? Icons.sunny
                    : CupertinoIcons.moon_fill,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      themeController.isdark.value
                          ? 'https://i.pinimg.com/236x/73/5b/78/735b78204d2105eb031f53baecc625e1.jpg'
                          : 'https://i.pinimg.com/236x/79/65/08/796508c90f41cdc0d13e8c9d609b8f93.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        onSubmitted: (val) async {
                          await searchController.initData(val);
                          weatherController.searchData();
                          city = val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          labelText: 'Search City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      weatherController.allSearchWeather.isEmpty
                          ? const Center(
                              child: Text('Search Any City'),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Location',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                      ),
                                      Text(
                                        city ?? "",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${weatherController.searchTemp(0).toStringAsFixed(0)}°',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    child: const Image(
                                      image: AssetImage(
                                        'lib/assets/ss.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment(-0.9, 0),
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: weatherController
                                          .allSearchWeather.length,
                                      itemBuilder: (context, index) =>
                                          weatherController
                                                      .allSearchWeather[index]
                                                      .dtTxt
                                                      .pickdate ==
                                                  DateTime.now().pickdate
                                              ? Container(
                                                  width: 100,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: themeController
                                                            .isdark.value
                                                        ? Colors.white
                                                            .withOpacity(0.3)
                                                        : Colors.black
                                                            .withOpacity(0.3),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        weatherController
                                                            .allSearchWeather[
                                                                index]
                                                            .dtTxt
                                                            .pickTime,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${weatherController.searchTemp(index).toStringAsFixed(0)}°',
                                                        style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: themeController
                                                                  .isdark.value
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        weatherController
                                                            .allSearchWeather[
                                                                index]
                                                            .dtTxt
                                                            .pickdate,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        weatherController
                                                            .allSearchWeather[
                                                                index]
                                                            .weather[0]
                                                            .main,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : null,
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment(-0.9, 0),
                                    child: Text(
                                      'This Week',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 140,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: weatherController
                                          .allSearchWeather.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        width: 100,
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: themeController.isdark.value
                                              ? Colors.white.withOpacity(0.3)
                                              : Colors.black.withOpacity(0.3),
                                        ),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              weatherController
                                                  .allSearchWeather[index]
                                                  .dtTxt
                                                  .pickTime,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '${weatherController.searchTemp(index).toStringAsFixed(0)}°',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    themeController.isdark.value
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                            Text(
                                              weatherController
                                                  .allSearchWeather[index]
                                                  .dtTxt
                                                  .pickdate,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              weatherController
                                                  .allSearchWeather[index]
                                                  .weather[0]
                                                  .main,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Obx(() {
        return ElevatedButton.icon(
          onPressed: () {
            int counter = 1;
            list
                ? favoriteDatabaseController.addFavorite(
                    favorite: FavoriteModal(city ?? 'city', 1))
                : null;
            list = false;
            if (counter == 1) {
              favoriteDatabaseController.allFavorite.forEach((e) {
                String tempCity = e.city;
                tempCity == city
                    ? favoriteDatabaseController.removeFavorite(
                        city: city ?? '')
                    : favoriteDatabaseController.addFavorite(
                        favorite: FavoriteModal(city ?? 'city', 1));
              });
            }
            counter = 0;
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(
                0.6,
              ),
            ),
          ),
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          label: Text(
            favoriteDatabaseController.allFavorite.contains(city)
                ? 'remove City from Favorite'
                : 'Add City to favorite',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
