import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/network/api_response.dart';
import 'package:weather_app/core/result.dart';
import 'package:weather_app/features/cities/domain/cities_use_case.dart';
import 'package:weather_app/features/cities/presentation/cities_search_state.dart';

class CitiesSearchViewModel extends Cubit<CitiesSearchState> {
  final _debounceKey = Uuid().v4();
  final CitiesUseCase _useCase;
  String _lastQuery = '';

  CitiesSearchViewModel({required CitiesUseCase useCase})
      : _useCase = useCase,
        super(CitiesSearchLoadingState());

  void searchCities(String query) {
    _lastQuery = query;
    EasyDebounce.debounce(_debounceKey, Duration(milliseconds: 500), () {
      _searchCities(keyword: query);
    });
  }

  Future<void> _searchCities({required String keyword}) async {
    if (keyword.length < 3) {
      emit(CitiesSearchInitialState());
      return;
    }
    emit(CitiesSearchLoadingState());
    final citiesResult = await _useCase.searchCities(
      keyword: keyword,
      limit: 5, // Can be adjusted, but now let's keep it fixed
    );
    if (isClosed || keyword != _lastQuery) {
      // If the state is closed or the search text has changed, do nothing
      return;
    }
    switch (citiesResult) {
      case Ok(value: final cities):
        emit(CitiesSearchLoadedState(cities: cities));
      case Err(failure: ApiFailure(errorType: ApiResponseErrorType.network)):
        emit(CitiesSearchNetworkErrorState());
      case Err(failure: ValidationFailure()):
      case Err(failure: ApiFailure(errorType: ApiResponseErrorType.badRequest)):
        emit(CitiesSearchBadRequestErrorState());
      case Err():
        emit(CitiesSearchUnknownErrorState());
    }
  }
}
