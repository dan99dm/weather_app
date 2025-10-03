import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/config/env.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/network/executor.dart';
import 'package:weather_app/features/weather_checker/data/dto/weather_dto.dart';

@Injectable()
class WeatherDataSource {
  final RemoteExecutor _exec;
  WeatherDataSource(Dio dio) : _exec = RemoteExecutor(dio);

  Future<ApiResponse<WeatherResponseDto>> getWeather({
    required double lat,
    required double lon,
  }) async {
    final String endpoint = 'https://api.openweathermap.org/data/2.5/weather';
    return _exec.run<WeatherResponseDto>(
      call: (dio) => dio.get(
        endpoint,
        queryParameters: {
          'appId': Env.openWeatherApiKey,
          'lat': lat,
          'lon': lon,
          'units': 'metric',
        },
      ),
      parse: (json) => WeatherResponseDto.fromJson(json),
      successCodes: const {200},
    );
  }
}
