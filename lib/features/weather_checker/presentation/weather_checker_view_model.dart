import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/weather_checker/domain/use_case.dart';
import 'package:weather_app/features/weather_checker/presentation/weather_checker_state.dart';

class WeatherCheckerViewModel extends Cubit<WeatherCheckerState> {
  final WeatherUseCase _useCase;
  String _invalidationKey = '';

  WeatherCheckerViewModel({required WeatherUseCase useCase})
      : _useCase = useCase,
        super(WeatherCheckerInitialState());

  Future<void> getLatLonWeather({
    required double lat,
    required double lon,
  }) async {
    final currentKey = Uuid().v4();
    _invalidationKey = currentKey;
    emit(WeatherCheckerLoadingState());
    final weatherResult = await _useCase.getWeather(
      lat: lat,
      lon: lon,
    );
    if (isClosed || currentKey != _invalidationKey) {
      // If the state is closed or newer request has been made, do nothing
      return;
    }
    switch (weatherResult) {
      case Ok(value: final weather):
        emit(WeatherCheckerLoadedState(weather: weather));
      case Err(failure: ApiFailure(errorType: ApiResponseErrorType.network)):
        emit(WeatherCheckerNetworkErrorState());
      case Err(failure: ApiFailure(errorType: ApiResponseErrorType.badRequest)):
        emit(WeatherCheckerBadRequestErrorState());
      case Err():
        emit(WeatherCheckerUnknownErrorState());
    }
  }
}
