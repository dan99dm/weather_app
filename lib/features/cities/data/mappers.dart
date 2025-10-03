import 'package:weather_app/features/cities/data/dto/city_dto.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

extension CityDTOMapper on CityDTO {
  CityEntity toEntity({
    required double latitude,
    required double longitude,
  }) {
    return CityEntity(
      name: name,
      countryCode: address.countryCode,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension CitiesDTOMapper on List<CityDTO> {
  List<CityEntity> toEntities() {
    final cleanedCities = where(
      (city) => city.geoCode.latitude != null && city.geoCode.longitude != null,
    );
    return cleanedCities
        .map(
          (city) => city.toEntity(
            latitude: city.geoCode.latitude!,
            longitude: city.geoCode.longitude!,
          ),
        )
        .toList();
  }
}
