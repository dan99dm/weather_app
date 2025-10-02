import 'package:flutter/material.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/features/weather/presentation/components/app_icon.dart';
import 'package:weather_app/features/weather/presentation/components/search_field.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              WeatherSearchField(controller: TextEditingController()),
            ],
          ),
        ),
      ),
    );
  }
}
