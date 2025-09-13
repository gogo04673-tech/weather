import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/core/functions/get_temperature_feels_like_range.dart';
import 'package:weather/core/functions/get_time_hourly.dart';
import 'package:weather/core/functions/weather_code.dart';
import 'package:weather/presentations/home/bloc/time_cubit.dart';
import 'package:weather/presentations/home/bloc/time_state.dart';
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
          List<String>? hours;

          return GestureDetector(
            onTap: () {
              // var result = setHoursWithSunriseAndSunset(
              //   time,
              //   state.weather.daily!.sunrise,
              //   state.weather.daily!.sunset,
              //   24,
              // );
              // print("result: ${result}");
              var r = isDayTime(
                context.read<TimeCubit>().timeNow!,
                state.weather.daily!.sunrise[0],
                state.weather.daily!.sunset[0],
                hours ?? [],
              );

              print(r);
            },
            child: Container(
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

                  /// * Hour             ==> 01:00 // sunrise / sunset
                  /// * image weather    ==> ⛅ // ☀️ / sunset
                  /// * temperature hour ==> 21\u00B0 // no thing
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: state.weather.hourly!.temperature2M.length + 2,
                      itemBuilder: (context, i) {
                        return Column(
                          // ! this is hour
                          children: [
                            BlocBuilder<TimeCubit, ClockState>(
                              builder: (context, time) {
                                hours = setHoursWithSunriseAndSunset(
                                  time.currentTime,
                                  state.weather.daily!.sunrise,
                                  state.weather.daily!.sunset,
                                  24,
                                );

                                return Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  //color: Colors.green,
                                  child: Text(
                                    hours![i],
                                    style: TextStyle(
                                      height: 0.6,
                                      color: const Color.fromARGB(
                                        255,
                                        153,
                                        177,
                                        187,
                                      ).withValues(alpha: .7),
                                    ),
                                  ),
                                );
                              },
                            ),

                            // ? Lottie || Image weather is here
                            if (hours != null)
                              Container(
                                margin:
                                    int.tryParse(hours![i].split(":")[1]) == 00
                                    ? const EdgeInsets.only(top: 2.8)
                                    : const EdgeInsets.only(top: 10),
                                alignment: Alignment.bottomCenter,
                                child: getWeatherLottie(
                                  weatherCodeList(
                                    hours!,
                                    state.weather.hourly!.weathercode,
                                    state.weather.daily!.sunrise,
                                    state.weather.daily!.sunset,
                                  )[i],
                                  context.watch<TimeCubit>().timeNow!,
                                  state.weather.daily!.sunrise,
                                  state.weather.daily!.sunset,
                                ),
                              ),

                            // * text temperature is here
                            if (hours != null)
                              Text(
                                //"${temperatureList(hours!, state.weather.hourly!.temperature2M, state.weather.daily!.sunrise, state.weather.daily!.sunset).length}\u00B0",
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
            ),
          );
        }

        return const Center();
      },
    );
  }
}
