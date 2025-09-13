import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/domain/weather/entities/weekly_weather.dart';
import 'package:weather/presentations/home/bloc/weekly_cubit.dart';
import 'package:weather/presentations/home/bloc/weekly_state.dart';
import 'package:weather/presentations/home/widgets/custom_row_day.dart';

class WeatherDays extends StatelessWidget {
  const WeatherDays({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklyCubit, WeeklyState>(
      builder: (context, state) {
        if (state is WeeklyLoading) {
          return const Center(child: Text("Loading"));
        }

        if (state is WeeklyFailureLoaded) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is WeeklyLoad) {
          return Container(
            height: 410,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.topLeft,

            decoration: BoxDecoration(
              color: AppColors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),

            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.weekly.daily!.time.length,
              itemBuilder: (context, i) {
                DailyEntity day = state.weekly.daily!;
                return CustomRowDay(daily: day, i: i);
              },
            ),
          );
        }
        return const Center(child: Text("not things"));
      },
    );
  }
}
