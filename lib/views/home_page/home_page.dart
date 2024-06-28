import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/WeatherController.dart';
import 'package:weather_forecast/controller/locationController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  LocationController locationController = Get.put(LocationController());
  WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('current location'),
      ),
      body: Obx(
        () => weatherController.allWeather.isEmpty
            ? const Center(
                child: LinearProgressIndicator(),
              )
            : Text('${weatherController.allWeather[0].main.temp}'),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          locationController.getCurrentLocation();
          weatherController.initData(
              lat: locationController.position?.latitude,
              lon: locationController.position?.longitude);
        },
        icon: const Icon(
          Icons.maps_home_work_rounded,
        ),
      ),
    );
  }
}
