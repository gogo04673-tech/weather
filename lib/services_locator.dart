import 'package:get_it/get_it.dart';
import 'package:weather/core/network/dio_client.dart';
import 'package:weather/data/weather/repositories/weather.dart';
import 'package:weather/data/weather/sources/service.dart';
import 'package:weather/domain/weather/repositories/weather.dart';
import 'package:weather/domain/weather/usecases/get_weather.dart';

final sl = GetIt.instance;

void setupServicesLocator() {
  // * ==============> Dio client <============== * //
  sl.registerSingleton<DioClient>(DioClient());

  // * ==============> Services <============== * //
  sl.registerSingleton<WeatherServices>(WeatherServicesImpl());

  // * ==============> Repository <============== * //
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl());

  // * ==============> Use Cases <============== * //
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase());
}
