import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponseDto {
  final WeatherCoordinatesDto coord;
  final List<WeatherMetaDto> weather;
  final WeatherDto main;

  WeatherResponseDto({
    required this.coord,
    required this.weather,
    required this.main,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherCoordinatesDto {
  final double lon;
  final double lat;

  WeatherCoordinatesDto({
    required this.lon,
    required this.lat,
  });

  factory WeatherCoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherCoordinatesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCoordinatesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherMetaDto {
  final String main;
  final String icon;

  WeatherMetaDto({
    required this.main,
    required this.icon,
  });

  factory WeatherMetaDto.fromJson(Map<String, dynamic> json) => _$WeatherMetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMetaDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherDto {
  final double temp;
  final double feelsLike;

  WeatherDto({
    required this.temp,
    required this.feelsLike,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
