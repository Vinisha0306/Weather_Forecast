import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/themeController.dart';
import 'package:weather_forecast/views/Search_page/Search_page.dart';
import 'package:weather_forecast/views/home_page/home_page.dart';
import 'package:weather_forecast/views/intro_page/intro_page.dart';
import 'package:weather_forecast/views/login_page/login_page.dart';
import 'package:weather_forecast/views/splashScreen/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(
          name: '/login_page',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home_page',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/intro_page',
          page: () => IntroPage(),
        ),
        GetPage(
          name: '/search_page',
          page: () => SearchPage(),
        ),
      ],
    );
  }
}
