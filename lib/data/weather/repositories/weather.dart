import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/common/mapper/weather.dart';
import 'package:weather/common/mapper/weekly.dart';
import 'package:weather/data/weather/models/weather.dart';
import 'package:weather/data/weather/models/weekly_weather.dart';
import 'package:weather/data/weather/sources/service.dart';
import 'package:weather/domain/weather/repositories/weather.dart';
import 'package:weather/services_locator.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<Either<String, dynamic>> getWeather(Position pos) async {
    var returnData = await sl<WeatherServices>().getWeather(pos);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var weather = WeatherMapper.toEntity(WeatherModel.fromJson(data));

        return Right(weather);
      },
    );
  }

  @override
  Future<Either<String, dynamic>> getWeeklyWeather(
    Map<String, dynamic> params,
  ) async {
    var returnData = await sl<WeatherServices>().getWeeklyWeather(params);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var weather = WeeklyMapper.toEntity(WeeklyModel.fromJson(data));

        return Right(weather);
      },
    );
  }
}
