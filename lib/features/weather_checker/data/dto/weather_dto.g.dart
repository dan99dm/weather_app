// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) =>
    WeatherResponseDto(
      coord:
          WeatherCoordinatesDto.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherMetaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: WeatherDto.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseDtoToJson(WeatherResponseDto instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
    };

WeatherCoordinatesDto _$WeatherCoordinatesDtoFromJson(
        Map<String, dynamic> json) =>
    WeatherCoordinatesDto(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherCoordinatesDtoToJson(
        WeatherCoordinatesDto instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherMetaDto _$WeatherMetaDtoFromJson(Map<String, dynamic> json) =>
    WeatherMetaDto(
      main: json['main'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherMetaDtoToJson(WeatherMetaDto instance) =>
    <String, dynamic>{
      'main': instance.main,
      'icon': instance.icon,
    };

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };
