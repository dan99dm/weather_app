import 'package:injectable/injectable.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/weather_checker/data/datasources/weather_api.dart';
import 'package:weather_app/features/weather_checker/data/mappers.dart';
import 'package:weather_app/features/weather_checker/domain/entity/weather_entity.dart';
import 'package:weather_app/features/weather_checker/domain/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherDataRepository implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherDataRepository(WeatherDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<Result<WeatherEntity>> getWeather({required double lat, required double lon}) async {
    final apiResponse = await _dataSource.getWeather(
      lat: lat,
      lon: lon,
    );
    switch (apiResponse) {
      case ApiResponseData():
        return Ok(apiResponse.data.toEntity());
      case ApiResponseError():
        return Err(ApiFailure(errorType: apiResponse.type));
    }
  }
}
