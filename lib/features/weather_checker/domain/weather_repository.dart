import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/weather_checker/domain/entity/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<Result<WeatherEntity>> getWeather({
    required double lat,
    required double lon,
  });
}
