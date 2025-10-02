import 'package:weather_app/features/cities/data/dto/city_dto.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

extension CityDTOMapper on CityDTO {
  CityEntity toEntity() {
    return CityEntity(
      name: name,
      countryCode: address.countryCode,
    );
  }
}

extension CitiesDTOMapper on List<CityDTO> {
  List<CityEntity> toEntities() {
    return map((city) => city.toEntity()).toList();
  }
}
