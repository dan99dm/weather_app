import 'package:injectable/injectable.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/cities/domain/cities_repository.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

@injectable
class CitiesUseCase {
  final CitiesRepository _repository;
  CitiesUseCase(this._repository);

  Future<Result<List<CityEntity>>> searchCities({
    required String keyword,
    required int limit,
  }) {
    return _repository.searchCities(
      keyword: keyword,
      limit: limit,
    );
  }
}
