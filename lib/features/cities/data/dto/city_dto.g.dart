// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDTO _$CityDTOFromJson(Map<String, dynamic> json) => CityDTO(
      name: json['name'] as String,
      address: CityAddressDto.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityDTOToJson(CityDTO instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };

CityAddressDto _$CityAddressDtoFromJson(Map<String, dynamic> json) =>
    CityAddressDto(
      countryCode: json['countryCode'] as String,
      stateCode: json['stateCode'] as String,
    );

Map<String, dynamic> _$CityAddressDtoToJson(CityAddressDto instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'stateCode': instance.stateCode,
    };
