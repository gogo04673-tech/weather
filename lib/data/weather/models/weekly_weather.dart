class WeeklyModel {
  WeeklyModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  factory WeeklyModel.fromJson(Map<String, dynamic> json) {
    return WeeklyModel(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      dailyUnits: json["daily_units"] == null
          ? null
          : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }
}

class Daily {
  Daily({
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

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: json["time"] == null
          ? []
          : List<DateTime>.from(
              json["time"]!.map((x) => DateTime.tryParse(x ?? "")),
            ),
      apparentTemperatureMax: json["apparent_temperature_max"] == null
          ? []
          : List<double>.from(json["apparent_temperature_max"]!.map((x) => x)),
      apparentTemperatureMin: json["apparent_temperature_min"] == null
          ? []
          : List<double>.from(json["apparent_temperature_min"]!.map((x) => x)),
      weathercode: json["weathercode"] == null
          ? []
          : List<int>.from(json["weathercode"]!.map((x) => x)),
      relativeHumidity2MMax: json["relative_humidity_2m_max"] == null
          ? []
          : List<int>.from(json["relative_humidity_2m_max"]!.map((x) => x)),
      relativeHumidity2MMin: json["relative_humidity_2m_min"] == null
          ? []
          : List<int>.from(json["relative_humidity_2m_min"]!.map((x) => x)),
    );
  }
}

class DailyUnits {
  DailyUnits({
    required this.time,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.weathercode,
    required this.relativeHumidity2MMax,
    required this.relativeHumidity2MMin,
  });

  final String? time;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? weathercode;
  final String? relativeHumidity2MMax;
  final String? relativeHumidity2MMin;

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      apparentTemperatureMax: json["apparent_temperature_max"],
      apparentTemperatureMin: json["apparent_temperature_min"],
      weathercode: json["weathercode"],
      relativeHumidity2MMax: json["relative_humidity_2m_max"],
      relativeHumidity2MMin: json["relative_humidity_2m_min"],
    );
  }
}
