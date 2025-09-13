class WeeklyEntity {
  WeeklyEntity({required this.daily});

  final DailyEntity? daily;
}

class DailyEntity {
  DailyEntity({
    required this.time,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.weathercode,
    required this.relativeHumidity2MMax,
    required this.relativeHumidity2MMin,
  });

  final List<DateTime> time;
  final List<double> apparentTemperatureMax;
  final List<double> apparentTemperatureMin;
  final List<int> weathercode;
  final List<int> relativeHumidity2MMax;
  final List<int> relativeHumidity2MMin;
}
