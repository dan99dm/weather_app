import 'package:weather_app/core/network/api_response.dart';

sealed class Failure {}

final class ApiFailure extends Failure {
  final ApiResponseErrorType errorType;
  ApiFailure({required this.errorType});

  @override
  String toString() => 'ApiFailure(errorType: $errorType)';
}
