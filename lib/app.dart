import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_weather/city_weather.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: CityWeatherScreen(),
    );
  }
}
