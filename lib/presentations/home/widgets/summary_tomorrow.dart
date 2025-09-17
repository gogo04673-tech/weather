import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/presentations/home/bloc/weather_cubit.dart';
import 'package:weather/presentations/home/bloc/weather_state.dart';

class SummaryTomorrow extends StatelessWidget {
  const SummaryTomorrow({super.key});

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * This text Tomorrow Outlook's
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: const Text(
                  "Tomorrow OutLook's",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                    height: 0.4,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // This is description
              Text(
                "Sunny tomorrow. ${state.weather.hourly!.apparentTemperature.reduce((a, b) => a > b ? a : b).round() > 25 ? "High of ${state.weather.hourly!.apparentTemperature.reduce((a, b) => a > b ? a : b).round()}\u00B0" : "High of ${state.weather.hourly!.apparentTemperature.reduce((a, b) => a > b ? a : b).round()}\u00B0"}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const Spacer(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: context.watch<WeatherCubit>().pageIndex == 1
                        ? Colors.white
                        : Colors.blueAccent.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: context.watch<WeatherCubit>().pageIndex == 0
                        ? Colors.white
                        : Colors.blueAccent.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ],
          );
        }

        return const Center();
      },
    );
  }
}

class RainTomorrow extends StatelessWidget {
  const RainTomorrow({super.key});

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * This text Tomorrow Outlook's
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: const Row(
                  children: [
                    Icon(Icons.sunny, color: Colors.white38, size: 15),
                    Text(
                      " Rise and shine",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 13,
                        height: 0.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // This is description
              Row(
                children: [
                  Text(
                    "Sunrise will be at ${DateTime.tryParse(state.weather.daily!.sunrise[0])!.hour}:${DateTime.tryParse(state.weather.daily!.sunrise[0])!.minute} AM",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: context.watch<WeatherCubit>().pageIndex == 1
                        ? Colors.white
                        : Colors.blueAccent.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: context.watch<WeatherCubit>().pageIndex == 0
                        ? Colors.white
                        : Colors.blueAccent.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ],
          );
        }

        return const Center();
      },
    );
  }
}

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const SummaryTomorrow(), const RainTomorrow()];
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 5),
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: AppColors.blue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: PageView.builder(
        controller: context.watch<WeatherCubit>().controller,

        onPageChanged: (i) {
          context.read<WeatherCubit>().pageIndex = i;
        },
        itemCount: pages.length,
        itemBuilder: (context, i) {
          return pages[i];
        },
      ),
    );
  }
}
