import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/configs/assets/app_lottie.dart';
import 'package:weather/domain/weather/entities/weekly_weather.dart';

class CustomRowDay extends StatelessWidget {
  const CustomRowDay({super.key, required this.daily, required this.i});
  final DailyEntity daily;
  final int i;

  @override
  Widget build(BuildContext context) {
    DateTime? date = DateTime.parse(daily.time[i].toString());
    List<String> _weekDays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * This is day
        Text(
          date.day == DateTime.now().day
              ? "Today"
              : _weekDays[date.weekday - 1],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        // This is water
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: const Icon(
                Icons.water_drop_rounded,
                size: 14,
                color: Colors.white54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "${daily.relativeHumidity2MMin[i]}%",
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  height: 0.5,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Lottie.asset(
                AppLottie.snowSunny,
                animate: false,
                width: 30,
              ),
            ),

            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.only(top: 6),
              child: Lottie.asset(
                AppLottie.snowMoon,
                animate: false,
                width: 30,
              ),
            ),
            const SizedBox(width: 10),

            Text(
              "${daily.apparentTemperatureMax[i].round()}\u00B0",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 0.5,
              ),
            ),

            const SizedBox(width: 4),
            Text(
              "${daily.apparentTemperatureMin[i].round()}\u00B0",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
