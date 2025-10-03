import 'package:json_annotation/json_annotation.dart';

part 'city_dto.g.dart';

@JsonSerializable()
class CityDTO {
  final String name;
  final CityAddressDto address;
  final CityGeoCodeDto geoCode;

  const CityDTO({
    required this.name,
    required this.address,
    required this.geoCode,
  });

  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CityDTOToJson(this);
}

@JsonSerializable()
class CityAddressDto {
  final String countryCode;
  final String stateCode;

  CityAddressDto({
    required this.countryCode,
    required this.stateCode,
  });

  factory CityAddressDto.fromJson(Map<String, dynamic> json) =>
      _$CityAddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CityAddressDtoToJson(this);
}

@JsonSerializable()
class CityGeoCodeDto {
  final double latitude;
  final double longitude;

  CityGeoCodeDto({
    required this.latitude,
    required this.longitude,
  });

  factory CityGeoCodeDto.fromJson(Map<String, dynamic> json) =>
      _$CityGeoCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CityGeoCodeDtoToJson(this);
}