import 'package:equatable/equatable.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

sealed class CitiesSearchState extends Equatable {
  const CitiesSearchState();
}

class CitiesSearchInitialState extends CitiesSearchState {
  const CitiesSearchInitialState();

  @override
  List<Object?> get props => [];
}

class CitiesSearchLoadingState extends CitiesSearchState {
  const CitiesSearchLoadingState();

  @override
  List<Object?> get props => [];
}

class CitiesSearchLoadedState extends CitiesSearchState {
  final List<CityEntity> cities;

  const CitiesSearchLoadedState({
    required this.cities,
  });

  CitiesSearchState copyWith({
    List<CityEntity>? cities,
  }) {
    return CitiesSearchLoadedState(
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [cities];
}

class CitiesSearchNetworkErrorState extends CitiesSearchState {
  const CitiesSearchNetworkErrorState();

  @override
  List<Object?> get props => [];
}

class CitiesSearchBadRequestErrorState extends CitiesSearchState {
  const CitiesSearchBadRequestErrorState();

  @override
  List<Object?> get props => [];
}

class CitiesSearchUnknownErrorState extends CitiesSearchState {
  const CitiesSearchUnknownErrorState();

  @override
  List<Object?> get props => [];
}
