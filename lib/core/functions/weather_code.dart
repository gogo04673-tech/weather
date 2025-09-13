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

// Widget getWeatherLottie(
//   int code,
//   DateTime currentTime,
//   List<String> sunriseStr,
//   List<String> sunsetStr,
// ) {
//   switch (code) {
//     case 0:
//       // "Clear Sky ☀️";
//       if (isDayTime(currentTime, sunriseStr[0], sunsetStr[0])) {
//         return Lottie.asset(AppLottie.moon, width: 30, animate: false);
//       } else {
//         return Lottie.asset(AppLottie.sunny, width: 30, animate: false);
//       }

//     case 1:
//       //  "Mainly Clear 🌤️";
//       if (isDayTime(currentTime, sunriseStr[0], sunsetStr[0])) {
//         return Lottie.asset(AppLottie.snowSunny, width: 35, animate: false);
//       } else {
//         return Lottie.asset(AppLottie.snowMoon, width: 35, animate: false);
//       }

//     case 2:
//       return Lottie.asset(
//         AppLottie.snowMoon,
//         width: 35,
//         animate: false,
//       ); //  "Partly Cloudy ⛅";
//     case 3:
//       return Lottie.asset(
//         AppLottie.windy,
//         width: 30,
//         animate: false,
//       ); //  "Overcast ☁️";
//     case 45:
//       return Image.asset(AppVectors.fog, width: 30); //  "Fog 🌫️";
//     case 51:
//       return Lottie.asset(
//         AppLottie.sunny,
//         width: 30,
//         animate: false,
//       ); //  "Drizzle 🌦️";
//     case 61:
//       return Lottie.asset(AppLottie.sunny, width: 30); //  "Rain 🌧️";
//     case 71:
//       return Lottie.asset(
//         AppLottie.sunny,
//       ); // Image.asset(AppVectors.snow, width: 30); //  "Snow ❄️";
//     case 80:
//       return Lottie.asset(AppLottie.sunny, width: 30); // Image.asset(
//     //   AppVectors.showers,
//     //   width: 30,
//     //   height: 10,
//     // ); //  "Showers 🌦️";
//     case 203:
//       return Lottie.asset(AppLottie.sunset, width: 30, animate: false);
//     case 202:
//       return Lottie.asset(AppLottie.sunrise, width: 30, animate: false);
//     default:
//       return Lottie.asset(
//         AppLottie.sunny,
//         width: 30,
//         animate: false,
//       ); //  "Unknown";
//   }
// }

isDayTime(
  DateTime currentTime,
  String sunriseStr,
  String sunsetStr,
  List hours,
) {
  DateTime sunrise = DateTime.parse(sunriseStr).toLocal();
  DateTime sunset = DateTime.parse(sunsetStr).toLocal();
  DateTime now = currentTime.toLocal();
  /*
    1 - check with hours list
    var t = hour.split(":");
    if (int.tryParse(t[0]) ) {
      print(hour);
      return true;
    }

  */
  for (String hour in hours) {
    var t = hour.split(":");
    if (int.tryParse(t[0]) == sunrise.hour &&
        int.tryParse(t[1]) == sunrise.minute) {
      print(hour);
    } else if (int.tryParse(t[0]) == sunset.hour &&
        int.tryParse(t[1]) == sunset.minute) {
      print("$hour this");
    }
  }

  //if (sunset.isAfter(sunrise))
}
// bool isDayTime(DateTime currentTime, String sunriseStr, String sunsetStr) {
//   DateTime sunrise = DateTime.parse(sunriseStr).toUtc();
//   DateTime sunset = DateTime.parse(sunsetStr).toUtc();
//   DateTime nowUtc = currentTime.toUtc();

//   // لو الساعة أقل من الشروق → ليل
//   if (nowUtc.isBefore(sunrise)) return false;

//   // لو بين الشروق والغروب → نهار
//   if (nowUtc.isAfter(sunrise) && nowUtc.isBefore(sunset)) return true;

//   // لو بعد الغروب → ليل
//   return false;
// }

// Widget getWeatherLottie(
//   int code,
//   DateTime currentTime,
//   List<String> sunriseStr,
//   List<String> sunsetStr,
// ) {
//   final bool day = isDayTime(currentTime, sunriseStr[0], sunsetStr[0]);

//   switch (code) {
//     case 0: // Clear Sky
//       return day
//           ? Lottie.asset(AppLottie.sunny, width: 30, animate: false)
//           : Lottie.asset(AppLottie.moon, width: 30, animate: false);

//     case 1: // Mainly Clear
//       return day
//           ? Lottie.asset(AppLottie.snowSunny, width: 35, animate: false)
//           : Lottie.asset(AppLottie.snowMoon, width: 35, animate: false);

//     case 2: // Partly Cloudy
//       return day
//           ? Lottie.asset(AppLottie.snowSunny, width: 35, animate: false)
//           : Lottie.asset(AppLottie.snowMoon, width: 35, animate: false);

//     case 3: // Overcast
//       return Lottie.asset(AppLottie.windy, width: 30, animate: false);

//     case 45: // Fog
//       return Lottie.asset(
//         AppLottie.windy,
//         width: 30,
//         animate: false,
//       ); // Image.asset(AppVectors.fog, width: 30);

//     case 51: // Drizzle drizzleDay drizzleNight
//       return day
//           ? Lottie.asset(AppLottie.windy, width: 30, animate: false)
//           : Lottie.asset(AppLottie.windy, width: 30, animate: false);

//     case 61: // Rain rainDay rainNight
//       return day
//           ? Lottie.asset(AppLottie.windy, width: 30, animate: false)
//           : Lottie.asset(AppLottie.windy, width: 30, animate: false);

//     case 71: // Snow
//       return day
//           ? Lottie.asset(AppLottie.snowSunny, width: 30, animate: false)
//           : Lottie.asset(AppLottie.snowMoon, width: 30, animate: false);

//     case 80: // Showers showersDay showersNight
//       return day
//           ? Lottie.asset(AppLottie.windy, width: 30, animate: false)
//           : Lottie.asset(AppLottie.windy, width: 30, animate: false);

//     case 202: // Sunrise
//       return Lottie.asset(AppLottie.sunrise, width: 30, animate: false);

//     case 203: // Sunset
//       return Lottie.asset(AppLottie.sunset, width: 30, animate: false);

//     default: // Unknown
//       return day
//           ? Lottie.asset(AppLottie.sunny, width: 30, animate: false)
//           : Lottie.asset(AppLottie.moon, width: 30, animate: false);
//   }
// }
Widget getWeatherLottie(
  int code,
  DateTime currentTime,
  List<String> sunriseStr,
  List<String> sunsetStr,
) {
  // *

  switch (code) {
    case 0:
      return Lottie.asset(AppLottie.sunny, width: 30, animate: false);
    case 202: // Sunrise
      return Lottie.asset(AppLottie.sunrise, width: 30, animate: false);

    case 203: // Sunset
      return Lottie.asset(AppLottie.sunset, width: 30, animate: false);
    default:
      return Lottie.asset(AppLottie.windy, width: 30, animate: false);
  }
}
