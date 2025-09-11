import 'package:weather/data/weather/models/weather.dart';
import 'package:weather/domain/weather/entities/weather.dart';

class WeatherMapper {
  static WeatherEntity toEntity(WeatherModel weather) {
    return WeatherEntity(
      latitude: weather.latitude,
      longitude: weather.longitude,
      hourly: weather.hourly == null
          ? null
          : HourlyEntity(
              time: weather.hourly!.time,
              temperature2M: weather.hourly!.temperature2M,
              apparentTemperature: weather.hourly!.apparentTemperature,
              weathercode: weather.hourly!.weathercode,
              windspeed10M: weather.hourly!.windspeed10M,
              relativehumidity2M: weather.hourly!.relativehumidity2M,
            ),
      daily: weather.daily == null
          ? null
          : DailyEntity(
              time: weather.daily!.time,
              sunrise: weather.daily!.sunrise,
              sunset: weather.daily!.sunset,
            ),
    );
  }
}
