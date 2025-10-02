import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiClientModule {
  @LazySingleton()
  Dio get dio => Dio()
    ..interceptors.add(LogInterceptor(
      requestHeader: true,
      request: true,
      responseBody: true,
    ));
}
