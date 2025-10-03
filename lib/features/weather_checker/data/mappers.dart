import 'package:weather_app/features/weather_checker/data/dto/weather_dto.dart';
import 'package:weather_app/features/weather_checker/domain/entity/weather_entity.dart';

extension WeatherDTOMapper on WeatherResponseDto {
  WeatherEntity toEntity() {
    return WeatherEntity(
      temperature: main.temp,
      feelsLike: main.feelsLike,
      description: weather.firstOrNull?.main,
      iconCode: weather.firstOrNull?.icon,
    );
  }
}
