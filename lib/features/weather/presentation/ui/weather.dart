import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/inject_config.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/features/cities/presentation/cities_search_view_model.dart';
import 'package:weather_app/features/weather/presentation/ui/components/app_icon.dart';
import 'package:weather_app/features/cities/presentation/ui/cities_search.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitiesSearchViewModel(
        useCase: getIt.get(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
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
                CityPickerField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
