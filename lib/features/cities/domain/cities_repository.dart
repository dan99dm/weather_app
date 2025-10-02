import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

abstract interface class CitiesRepository {
  Future<Result<List<CityEntity>>> searchCities({
    required String keyword,
    required int limit,
  });
}
