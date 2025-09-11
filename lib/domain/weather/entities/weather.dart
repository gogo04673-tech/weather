class WeatherEntity {
  WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.hourly,
    required this.daily,
  });

  final double? latitude;
  final double? longitude;
  final HourlyEntity? hourly;
  final DailyEntity? daily;
}

class DailyEntity {
  DailyEntity({
    required this.time,
    required this.sunrise,
    required this.sunset,
  });

  final List<DateTime> time;
  final List<String> sunrise;
  final List<String> sunset;
}

class HourlyEntity {
  HourlyEntity({
    required this.time,
    required this.temperature2M,
    required this.apparentTemperature,
    required this.weathercode,
    required this.windspeed10M,
    required this.relativehumidity2M,
  });

  final List<String> time;
  final List<double> temperature2M;
  final List<double> apparentTemperature;
  final List<int> weathercode;
  final List<double> windspeed10M;
  final List<int> relativehumidity2M;
}
