import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/weather.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: WeatherScreen(),
    );
  }
}
