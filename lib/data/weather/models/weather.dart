class WeatherModel {
  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
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
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      hourlyUnits: json["hourly_units"] == null
          ? null
          : HourlyUnits.fromJson(json["hourly_units"]),
      hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      dailyUnits: json["daily_units"] == null
          ? null
          : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }
}

class Daily {
  Daily({required this.time, required this.sunrise, required this.sunset});

  final List<DateTime> time;
  final List<String> sunrise;
  final List<String> sunset;

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: json["time"] == null
          ? []
          : List<DateTime>.from(
              json["time"]!.map((x) => DateTime.tryParse(x ?? "")),
            ),
      sunrise: json["sunrise"] == null
          ? []
          : List<String>.from(json["sunrise"]!.map((x) => x)),
      sunset: json["sunset"] == null
          ? []
          : List<String>.from(json["sunset"]!.map((x) => x)),
    );
  }
}

class DailyUnits {
  DailyUnits({required this.time, required this.sunrise, required this.sunset});

  final String? time;
  final String? sunrise;
  final String? sunset;

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }
}

class Hourly {
  Hourly({
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

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: json["time"] == null
          ? []
          : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M: json["temperature_2m"] == null
          ? []
          : List<double>.from(json["temperature_2m"]!.map((x) => x)),
      apparentTemperature: json["apparent_temperature"] == null
          ? []
          : List<double>.from(json["apparent_temperature"]!.map((x) => x)),
      weathercode: json["weathercode"] == null
          ? []
          : List<int>.from(json["weathercode"]!.map((x) => x)),
      windspeed10M: json["windspeed_10m"] == null
          ? []
          : List<double>.from(json["windspeed_10m"]!.map((x) => x)),
      relativehumidity2M: json["relativehumidity_2m"] == null
          ? []
          : List<int>.from(json["relativehumidity_2m"]!.map((x) => x)),
    );
  }
}

class HourlyUnits {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.apparentTemperature,
    required this.weathercode,
    required this.windspeed10M,
    required this.relativehumidity2M,
  });

  final String? time;
  final String? temperature2M;
  final String? apparentTemperature;
  final String? weathercode;
  final String? windspeed10M;
  final String? relativehumidity2M;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      apparentTemperature: json["apparent_temperature"],
      weathercode: json["weathercode"],
      windspeed10M: json["windspeed_10m"],
      relativehumidity2M: json["relativehumidity_2m"],
    );
  }
}
