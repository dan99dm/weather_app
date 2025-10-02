import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

sealed class CitiesSearchState {
  CitiesSearchState();
}

class CitiesSearchInitialState extends CitiesSearchState {
  CitiesSearchInitialState();
}

class CitiesSearchLoadingState extends CitiesSearchState {
  CitiesSearchLoadingState();
}

class CitiesSearchLoadedState extends CitiesSearchState {
  final List<CityEntity> cities;

  CitiesSearchLoadedState({
    required this.cities,
  });

  CitiesSearchState copyWith({
    List<CityEntity>? cities,
    CityEntity? pickedCity,
  }) {
    return CitiesSearchLoadedState(
      cities: cities ?? this.cities,
    );
  }
}

class CitiesSearchNetworkErrorState extends CitiesSearchState {
  CitiesSearchNetworkErrorState();
}

class CitiesSearchBadRequestErrorState extends CitiesSearchState {
  CitiesSearchBadRequestErrorState();
}

class CitiesSearchUnknownErrorState extends CitiesSearchState {
  CitiesSearchUnknownErrorState();
}
