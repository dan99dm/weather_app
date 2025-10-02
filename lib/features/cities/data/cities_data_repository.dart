import 'package:injectable/injectable.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/cities/data/datasources/cities_api.dart';
import 'package:weather_app/features/cities/data/mappers.dart';
import 'package:weather_app/features/cities/domain/cities_repository.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

@Injectable(as: CitiesRepository)
class CitiesDataRepository implements CitiesRepository {
  final CitiesDataSource _dataSource;

  CitiesDataRepository(CitiesDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<Result<List<CityEntity>>> searchCities({
    required String keyword,
    required int limit,
  }) async {
    final apiResponse = await _dataSource.searchCities(
      keyword: keyword,
      limit: limit,
    );
    switch (apiResponse) {
      case ApiResponseData():
        return Ok(apiResponse.data.data.toEntities());
      case ApiResponseError():
        return Err(ApiFailure(errorType: apiResponse.type));
    }
  }
}
