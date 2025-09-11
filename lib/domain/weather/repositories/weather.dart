import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class WeatherRepository {
  Future<Either<String, dynamic>> getWeather(Position pos);
}
