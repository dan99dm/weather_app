import 'package:weather_app/features/weather_checker/domain/entity/weather_entity.dart';

sealed class WeatherCheckerState {
  WeatherCheckerState();
}

class WeatherCheckerInitialState extends WeatherCheckerState {
  WeatherCheckerInitialState();
}

class WeatherCheckerLoadingState extends WeatherCheckerState {
  WeatherCheckerLoadingState();
}

class WeatherCheckerLoadedState extends WeatherCheckerState {
  final WeatherEntity weather;

  WeatherCheckerLoadedState({
    required this.weather,
  });
}

class WeatherCheckerNetworkErrorState extends WeatherCheckerState {
  WeatherCheckerNetworkErrorState();
}

class WeatherCheckerBadRequestErrorState extends WeatherCheckerState {
  WeatherCheckerBadRequestErrorState();
}

class WeatherCheckerUnknownErrorState extends WeatherCheckerState {
  WeatherCheckerUnknownErrorState();
}
