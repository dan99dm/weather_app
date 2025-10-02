import 'package:json_annotation/json_annotation.dart';

import 'city_dto.dart';

part 'cities_response_dto.g.dart';

@JsonSerializable()
class CitiesResponseDTO {
  @JsonKey(defaultValue: [])
  final List<CityDTO> data;

  CitiesResponseDTO({required this.data});

  factory CitiesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResponseDTOToJson(this);
}
