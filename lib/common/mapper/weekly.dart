import 'package:weather/data/weather/models/weekly_weather.dart';
import 'package:weather/domain/weather/entities/weekly_weather.dart';

class WeeklyMapper {
  static WeeklyEntity toEntity(WeeklyModel weather) {
    return WeeklyEntity(
      daily: weather.daily == null
          ? null
          : DailyEntity(
              time: weather.daily!.time,
              apparentTemperatureMax: weather.daily!.apparentTemperatureMax,
              apparentTemperatureMin: weather.daily!.apparentTemperatureMin,
              weathercode: weather.daily!.weathercode,
              relativeHumidity2MMax: weather.daily!.relativeHumidity2MMax,
              relativeHumidity2MMin: weather.daily!.relativeHumidity2MMin,
            ),
    );
  }
}
