import 'package:injectable/injectable.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/weather_checker/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather_checker/domain/weather_repository.dart';

@injectable
class WeatherUseCase {
  final WeatherRepository _repository;

  WeatherUseCase({
    required WeatherRepository repository,
  }) : _repository = repository;

  Future<Result<WeatherEntity>> getWeather({
    required double lat,
    required double lon,
  }) {
    return _repository.getWeather(
      lat: lat,
      lon: lon,
    );
  }
}
