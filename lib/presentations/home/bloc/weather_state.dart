import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/domain/weather/entities/weather.dart';

abstract class WeatherState extends Equatable {}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherFailureLoaded extends WeatherState {
  final String errorMessage;
  WeatherFailureLoaded({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class WeatherLoad extends WeatherState {
  final WeatherEntity weather;
  final Placemark place;
  WeatherLoad({required this.weather, required this.place});
  @override
  List<Object?> get props => [weather];
}
