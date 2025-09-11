import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/core/functions/get_temperature_feels_like_range.dart';
import 'package:weather/core/functions/weather_code.dart';
import 'package:weather/presentations/home/bloc/weather_cubit.dart';
import 'package:weather/presentations/home/bloc/weather_state.dart';

class WeatherHourly extends StatelessWidget {
  const WeatherHourly({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: Text("Loading"));
        }

        if (state is WeatherFailureLoaded) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is WeatherLoad) {
          return Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            margin: const EdgeInsets.only(top: 28),
            alignment: Alignment.topLeft,

            decoration: BoxDecoration(
              color: AppColors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getWeatherAllDescription(
                    state.weather.hourly!.apparentTemperature,
                    state.weather.hourly!.weathercode,
                  ), // "Partly cloudy. Low 18C.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // line
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 0.5),
                ),

                /// * Hour             ==> 01:00
                /// * image weather    ==> ⛅
                /// * temperature hour ==> 21\u00B0
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 5),
                    itemCount: state.weather.hourly!.temperature2M.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Text(
                            "${((time.hour + i) % 24).toString().padLeft(2, "0")}:00",
                            style: TextStyle(
                              color: Colors.grey.withValues(alpha: 0.6),
                            ),
                          ),

                          // image
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 6),
                            child: getWeatherLottie(
                              state.weather.hourly!.weathercode[i],
                            ),
                          ),

                          // text temperature
                          Text(
                            "${state.weather.hourly!.temperature2M[i].round()}\u00B0",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          );
        }

        return const Center();
      },
    );
  }
}
