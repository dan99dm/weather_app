import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/inject_config.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/features/cities/presentation/cities_search_view_model.dart';
import 'package:weather_app/features/cities/presentation/ui/cities_search.dart';
import 'package:weather_app/features/weather_checker/presentation/ui/weather.dart';
import 'package:weather_app/features/weather_checker/presentation/weather_checker_view_model.dart';
import 'package:weather_app/screens/city_weather/components/app_icon.dart';

class CityWeatherScreen extends StatelessWidget {
  const CityWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CitiesSearchViewModel(
            useCase: getIt.get(),
          ),
        ),
        BlocProvider(
          create: (context) => WeatherCheckerViewModel(
            useCase: getIt.get(),
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                SizedBox(height: 32),
                AppIcon(),
                SizedBox(height: 16),
                Text(
                  'Weather App',
                  style: BrandTextStyle.s30w700,
                ),
                SizedBox(height: 16),
                Text(
                  'Search for any city to get current temperature',
                  style: BrandTextStyle.s14w400,
                ),
                SizedBox(height: 16),
                CityPickerWidget(),
                SizedBox(height: 64),
                WeatherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
