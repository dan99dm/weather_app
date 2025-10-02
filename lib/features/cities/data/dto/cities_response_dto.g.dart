// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponseDTO _$CitiesResponseDTOFromJson(Map<String, dynamic> json) =>
    CitiesResponseDTO(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CityDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CitiesResponseDTOToJson(CitiesResponseDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
