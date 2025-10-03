import 'package:equatable/equatable.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';

class CityWeatherState extends Equatable {
  final CityEntity? pickedCity;

  const CityWeatherState({this.pickedCity});

  @override
  List<Object?> get props => [pickedCity];
}
