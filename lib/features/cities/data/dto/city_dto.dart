import 'package:json_annotation/json_annotation.dart';

part 'city_dto.g.dart';

@JsonSerializable()
class CityDTO {
  final String name;
  final CityAddressDto address;

  const CityDTO({
    required this.name,
    required this.address,
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