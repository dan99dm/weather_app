import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/config/env.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/network/executor.dart';
import 'package:weather_app/features/cities/data/dto/cities_response_dto.dart';

@Injectable()
class CitiesDataSource {
  final RemoteExecutor _exec;
  CitiesDataSource(Dio dio) : _exec = RemoteExecutor(dio);

  Future<ApiResponse<CitiesResponseDTO>> searchCities({
    required String keyword,
    required int limit,
  }) async {
    final String endpoint = 'https://test.api.amadeus.com/v1/reference-data/locations/cities';
    return _exec.run<CitiesResponseDTO>(
      call: (dio) => dio.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Env.amadeusApiKey}'
          }
        ),
        queryParameters: {
          'keyword': keyword,
          'max': limit,
        },
      ),

      parse: (json) => CitiesResponseDTO.fromJson(json),
      successCodes: const {200},
    );
  }
}
