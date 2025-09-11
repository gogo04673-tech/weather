import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/configs/assets/app_lottie.dart';
import 'package:weather/core/configs/assets/app_vectors.dart';

String getWeatherDescription(int code) {
  switch (code) {
    case 0:
      return "Clear Sky ☀️";
    case 1:
      return "Mainly Clear 🌤️";
    case 2:
      return "Partly Cloudy ⛅";
    case 3:
      return "Overcast ☁️";
    case 45:
      return "Fog 🌫️";
    case 51:
      return "Drizzle 🌦️";
    case 61:
      return "Rain 🌧️";
    case 71:
      return "Snow ❄️";
    case 80:
      return "Showers 🌦️";
    default:
      return "Unknown";
  }
}

Widget getWeatherLottie(int code) {
  switch (code) {
    case 0:
      return Lottie.asset(
        AppLottie.sunny,
        width: 30,
        animate: false,
      ); // "Clear Sky ☀️";
    case 1:
      return Lottie.asset(
        AppLottie.snowSunny,
        width: 30,
        animate: false,
      ); //  "Mainly Clear 🌤️";
    case 2:
      return Lottie.asset(
        AppLottie.snowMoon,
        width: 30,
        animate: false,
      ); //  "Partly Cloudy ⛅";
    case 3:
      return Lottie.asset(
        AppLottie.windy,
        width: 30,
        animate: false,
      ); //  "Overcast ☁️";
    case 45:
      return Image.asset(AppVectors.fog, width: 30); //  "Fog 🌫️";
    case 51:
      return Lottie.asset(
        AppLottie.sunny,
        width: 30,
        animate: false,
      ); //  "Drizzle 🌦️";
    case 61:
      return Lottie.asset(AppLottie.sunny); //  "Rain 🌧️";
    case 71:
      return Image.asset(AppVectors.snow, width: 30); //  "Snow ❄️";
    case 80:
      return Image.asset(AppVectors.showers, width: 30); //  "Showers 🌦️";
    case 8:
      return Lottie.asset(AppLottie.sunset, width: 30, animate: false);
    case 9:
      return Lottie.asset(AppLottie.sunrise, width: 30, animate: false);
    default:
      return Lottie.asset(
        AppLottie.sunny,
        width: 30,
        animate: false,
      ); //  "Unknown";
  }
}
