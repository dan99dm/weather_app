import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/features/weather_checker/presentation/ui/open_weather_icon.dart';
import 'package:weather_app/features/weather_checker/presentation/weather_checker_state.dart';
import 'package:weather_app/features/weather_checker/presentation/weather_checker_view_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WeatherCheckerViewModel>().state;
    switch (state) {
      case WeatherCheckerLoadingState():
        return _Content(
          icon: CircularProgressIndicator(),
          title: 'Loading weather data...',
        );
      case WeatherCheckerLoadedState():
        return _Content(
          icon: OpenWeatherIcon(
            iconCode: state.weather.iconCode,
          ),
          title: '${state.weather.temperature}°C, ${state.weather.description}',
          subtitle: 'Feels like ${state.weather.feelsLike}°C',
        );

      case WeatherCheckerNetworkErrorState():
        return _Content(
          icon: Icon(Icons.wifi_off, size: 64, color: Colors.grey),
          title: 'Network error. Please check your internet connection.',
        );
      case WeatherCheckerBadRequestErrorState():
        return _Content(
          icon: Icon(Icons.warning, size: 64, color: Colors.orange),
          title: 'Bad request. Please try again later.',
        );
      case WeatherCheckerUnknownErrorState():
        return _Content(
          icon: Icon(Icons.error, size: 64, color: Colors.red),
          title: 'An unknown error occurred. Please try again.',
        );
      case WeatherCheckerInitialState():
        return _Content(
          icon: Icon(Icons.cloud, size: 64, color: Colors.blue),
          title: 'Select a city to see the weather information.',
        );
    }
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget icon;

  const _Content({
    required this.icon,
    required this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 16),
        Text(
          title,
          style: BrandTextStyle.s20w500,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        if (subtitle case final String description)
          Text(
            description,
            style: BrandTextStyle.s14w400,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
