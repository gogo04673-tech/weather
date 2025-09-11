import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/functions/get_temperature_feels_like_range.dart';
import 'package:weather/core/functions/weather_code.dart';
import 'package:weather/presentations/home/bloc/weather_cubit.dart';
import 'package:weather/presentations/home/bloc/weather_state.dart';

class WeatherTemperatures extends StatelessWidget {
  const WeatherTemperatures({super.key});

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
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              height: 200,

              child: Stack(
                children: [
                  // Cold
                  Positioned(
                    bottom: 90,
                    child: Text(
                      getWeatherDescription(
                        state.weather.hourly!.weathercode[time.hour],
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    child: Text(
                      getFeelsLikeRange(
                        state.weather.hourly!.apparentTemperature,
                        state.weather.hourly!.temperature2M,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Temperature is here
                  Positioned(
                    top: -8,
                    left: 1,
                    child: Text(
                      getTemperature(state.weather.hourly!.temperature2M),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
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
