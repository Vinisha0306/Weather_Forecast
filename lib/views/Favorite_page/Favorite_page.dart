import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/FavoriteDatabaseController.dart';
import 'package:weather_forecast/controller/SerachController.dart';
import 'package:weather_forecast/controller/WeatherController.dart';
import 'package:weather_forecast/views/Search_page/Search_page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  FavoriteDatabaseController favoriteDatabaseController =
      Get.put(FavoriteDatabaseController());
  SearchCityController searchController = Get.find<SearchCityController>();
  WeatherController weatherController = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return favoriteDatabaseController.allFavorite.isNotEmpty
              ? ListView.builder(
                  itemCount: favoriteDatabaseController.allFavorite.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () async {
                      city = favoriteDatabaseController.allFavorite[index].city;
                      Get.toNamed('/search_page');
                      await searchController.initData(city);
                      weatherController.searchData();
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(1000),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://i.pinimg.com/236x/b5/fd/d5/b5fdd5a81f1c72502de44267a3cba10b.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            favoriteDatabaseController.allFavorite[index].city,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 230,
                          child: Container(
                            height: 180,
                            width: 180,
                            child: const Image(
                              image: AssetImage(
                                'lib/assets/ss.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Text('no data');
        },
      ),
    );
  }
}
