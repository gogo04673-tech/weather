import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/usecases/use_ase.dart';
import 'package:weather/domain/weather/repositories/weather.dart';
import 'package:weather/services_locator.dart';

class GetWeatherUseCase extends UseCase<Either<String, dynamic>, Position> {
  @override
  Future<Either<String, dynamic>> call({Position? params}) async {
    return await sl<WeatherRepository>().getWeather(params!);
  }
}
