import 'package:dio/dio.dart';
import 'package:weather_app/core/network/api_response.dart';

typedef Parser<T> = T Function(dynamic json);

class RemoteExecutor {
  final Dio dio;
  RemoteExecutor(this.dio);

  Future<ApiResponse<T>> run<T>({
    required Future<Response<dynamic>> Function(Dio dio) call,
    required Parser<T> parse,
    Set<int> successCodes = const {200},
  }) async {
    try {
      final res = await call(dio);
      final code = res.statusCode ?? 0;

      if (successCodes.contains(code)) {
        return ApiResponseData(data: parse(res.data));
      }

      if (code >= 400 && code < 500) {
        return ApiResponseError.badRequest();
      }
      if (code >= 500) {
        return ApiResponseError.internalError();
      }
      return ApiResponseError.unknown();
    } on DioException catch (e) {
      return _mapDioException(e);
    } catch (err) {
      return ApiResponseError.unknown();
    }
  }

  ApiResponse<T> _mapDioException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return ApiResponseError.networkError();
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 0;
        if (status >= 400 && status < 500) return ApiResponseError.badRequest();
        if (status >= 500) return ApiResponseError.internalError();
        return ApiResponseError.unknown();
      case DioExceptionType.cancel:
        return ApiResponseError.unknown();
      case DioExceptionType.unknown:
        return ApiResponseError.unknown();
    }
  }
}
