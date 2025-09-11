import 'package:weather/core/functions/weather_code.dart';

DateTime time = DateTime.now();

String getFeelsLikeRange(
  List<double> apparentTemperature,
  List<double> temperature,
) {
  var maxTemp = apparentTemperature.reduce((a, b) => a > b ? a : b).round();
  var minTemp = apparentTemperature.reduce((a, b) => a < b ? a : b).round();

  return "$maxTemp\u00B0 / $minTemp\u00B0 Feels like ${temperature[time.hour].round()}\u00B0";
}

String getWeatherAllDescription(
  List<double> apparentTemperature,
  List<int> weatherCode,
) {
  // var maxTemp = apparentTemperature.reduce((a, b) => a > b ? a : b).round();
  var minTemp = apparentTemperature.reduce((a, b) => a < b ? a : b).round();

  return "${getWeatherDescription(weatherCode[time.hour])}. Low ${minTemp}C.";
}

String getTemperature(List<double> temperature) {
  return "${temperature[time.hour].round()}\u00B0";
}
