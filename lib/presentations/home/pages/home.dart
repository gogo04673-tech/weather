import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/common/widgets/animation/bloc/animated_cubit.dart';
import 'package:weather/common/widgets/appbar/app_bar.dart';
import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/presentations/home/bloc/time_cubit.dart';
import 'package:weather/presentations/home/bloc/weather_cubit.dart';
import 'package:weather/presentations/home/bloc/weather_state.dart';
import 'package:weather/presentations/home/bloc/weekly_cubit.dart';
import 'package:weather/presentations/home/widgets/summary_tomorrow.dart';
import 'package:weather/presentations/home/widgets/weather_days.dart';
import 'package:weather/presentations/home/widgets/weather_hourly.dart';
import 'package:weather/presentations/home/widgets/weather_temperatures.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      
      print("scroll: ${_controller.offset}");
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherCubit()..getData()),
        BlocProvider(create: (context) => WeeklyCubit()..getData()),
        BlocProvider(create: (context) => AnimatedCubit()),
        BlocProvider(create: (context) => TimeCubit()),
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: true,
          height: 85,
          title: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoad) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.only(top: 18, left: 15),
                      child: const Icon(Icons.list, size: 30),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      state.place.subLocality ?? 'Unknown',
                      style: const TextStyle(
                        color: AppColors.white,
                        height: 2.5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 18, left: 1),
                      child: const Icon(Icons.location_on, size: 15),
                    ),
                  ],
                );
              }
              return const Center();
            },
          ),
        ),

        body: SafeArea(
          maintainBottomViewPadding: true,
          right: true,
          left: true,
          minimum: const EdgeInsets.symmetric(horizontal: 10),
          child: _scroll(),
        ),
      ),
    );
  }

  Widget _scroll() {
    return SingleChildScrollView(
      controller: _controller,
      child: const Column(
        children: [
          // * Temperatures with weather code is here
          WeatherTemperatures(),

          // * Weather 24 hour in future
          WeatherHourly(),

          // Tomorrow OutLook's
          // SummaryTomorrow(),
          MyPageView(),

          // This weekly days
          WeatherDays(),
        ],
      ),
    );
  }
}
