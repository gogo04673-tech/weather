import 'package:dartz/dartz.dart';
import 'package:weather/core/usecases/use_ase.dart';
import 'package:weather/domain/weather/repositories/weather.dart';
import 'package:weather/services_locator.dart';

class GetWeeklyWeatherUseCase
    extends UseCase<Either<String, dynamic>, Map<String, dynamic>> {
  @override
  Future<Either<String, dynamic>> call({Map<String, dynamic>? params}) async {
    return await sl<WeatherRepository>().getWeeklyWeather(params!);
  }
}
