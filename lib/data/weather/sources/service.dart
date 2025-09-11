import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/network/dio_client.dart';
import 'package:weather/services_locator.dart';

abstract class WeatherServices {
  Future<Either<String, dynamic>> getWeather(Position pos);
}

class WeatherServicesImpl extends WeatherServices {
  @override
  Future<Either<String, dynamic>> getWeather(Position? pos) async {
    if (pos == null) {
      return Left("Position is null : $pos");
    }
    try {
      var response = await sl<DioClient>().get(
        "https://api.open-meteo.com/v1/forecast?latitude=${pos.latitude}&longitude=${pos.longitude}&hourly=temperature_2m,apparent_temperature,weathercode,windspeed_10m,relativehumidity_2m&daily=sunrise,sunset&forecast_days=1&timezone=auto",
        //"https://api.open-meteo.com/v1/forecast?latitude=${pos.latitude}&longitude=${pos.longitude}&hourly=temperature_2m,apparent_temperature,weathercode,windspeed_10m,relativehumidity_2m&forecast_days=1&timezone=auto",
      );

      return Right(response.data);
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      return Left(errorMsg);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
