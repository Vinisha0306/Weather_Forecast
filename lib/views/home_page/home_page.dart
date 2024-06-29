import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/WeatherController.dart';
import 'package:weather_forecast/controller/liveLocationController.dart';
import 'package:weather_forecast/controller/locationController.dart';
import 'package:weather_forecast/controller/themeController.dart';
import 'package:weather_forecast/extension.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  LiveLocationController liveLocationController =
      Get.put(LiveLocationController());
  WeatherController weatherController = Get.put(WeatherController());
  LocationController locationController = Get.put(LocationController());
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
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
          IconButton(
            onPressed: () {
              Get.toNamed('/search_page');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () async {
              await weatherController.initData();
            },
            icon: const Icon(
              Icons.location_on,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue.withOpacity(0.8),
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                themeController.isdark.value
                    ? 'https://i.pinimg.com/564x/26/0d/1f/260d1ff94516a68909cac5c2fd3b75ca.jpg'
                    : 'https://i.pinimg.com/564x/5d/8f/30/5d8f30d0dcaf5d4fcff2fb08bf2f6fd5.jpg',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: weatherController.allWeather.isEmpty
              ? const Center(
                  child: LinearProgressIndicator(),
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
                            locationController.allLocation[0].name,
                          ),
                        ],
                      ),
                      Text(
                        '${weatherController.temp(0).toStringAsFixed(0)}°',
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
                          itemCount: weatherController.allWeather.length,
                          itemBuilder: (context, index) => weatherController
                                      .allWeather[index].dtTxt.pickdate ==
                                  DateTime.now().pickdate
                              ? Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: themeController.isdark.value
                                        ? Colors.white.withOpacity(0.3)
                                        : Colors.black.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        weatherController
                                            .allWeather[index].dtTxt.pickTime,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${weatherController.temp(index).toStringAsFixed(0)}°',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: themeController.isdark.value
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      Text(
                                        weatherController
                                            .allWeather[index].dtTxt.pickdate,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        weatherController
                                            .allWeather[index].weather[0].main,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
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
                          itemCount: weatherController.allWeather.length,
                          itemBuilder: (context, index) => Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: themeController.isdark.value
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.3),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  weatherController
                                      .allWeather[index].dtTxt.pickTime,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${weatherController.temp(index).toStringAsFixed(0)}°',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: themeController.isdark.value
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  weatherController
                                      .allWeather[index].dtTxt.pickdate,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  weatherController
                                      .allWeather[index].weather[0].main,
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
        ),
      ),
    );
  }
}
