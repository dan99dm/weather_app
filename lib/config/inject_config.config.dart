// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/client.dart' as _i316;
import '../features/cities/data/cities_data_repository.dart' as _i32;
import '../features/cities/data/datasources/cities_api.dart' as _i822;
import '../features/cities/domain/cities_repository.dart' as _i693;
import '../features/cities/domain/cities_use_case.dart' as _i404;
import '../features/weather_checker/data/datasources/weather_api.dart' as _i217;
import '../features/weather_checker/data/weather_data_repository.dart' as _i756;
import '../features/weather_checker/domain/use_case.dart' as _i272;
import '../features/weather_checker/domain/weather_repository.dart' as _i990;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiClientModule = _$ApiClientModule();
    gh.lazySingleton<_i361.Dio>(() => apiClientModule.dio);
    gh.factory<_i822.CitiesDataSource>(
        () => _i822.CitiesDataSource(gh<_i361.Dio>()));
    gh.factory<_i217.WeatherDataSource>(
        () => _i217.WeatherDataSource(gh<_i361.Dio>()));
    gh.factory<_i990.WeatherRepository>(
        () => _i756.WeatherDataRepository(gh<_i217.WeatherDataSource>()));
    gh.factory<_i272.WeatherUseCase>(
        () => _i272.WeatherUseCase(repository: gh<_i990.WeatherRepository>()));
    gh.factory<_i693.CitiesRepository>(
        () => _i32.CitiesDataRepository(gh<_i822.CitiesDataSource>()));
    gh.factory<_i404.CitiesUseCase>(
        () => _i404.CitiesUseCase(gh<_i693.CitiesRepository>()));
    return this;
  }
}

class _$ApiClientModule extends _i316.ApiClientModule {}
