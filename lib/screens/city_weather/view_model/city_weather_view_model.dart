import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';
import 'package:weather_app/features/weather_checker/presentation/weather_checker_view_model.dart';
import 'package:weather_app/screens/city_weather/view_model/city_weather_state.dart';

class CityWeatherViewModel extends Cubit<CityWeatherState> {
  final WeatherCheckerViewModel _weatherVM;

  CityWeatherViewModel({
    required WeatherCheckerViewModel weatherVM,
  })  : _weatherVM = weatherVM,
        super(CityWeatherState(pickedCity: null));

  void pickCity(CityEntity city) {
    _weatherVM.getLatLonWeather(
      lat: city.latitude,
      lon: city.longitude,
    );
    emit(CityWeatherState(pickedCity: city));
  }
}
