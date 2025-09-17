import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/common/helpers/navigations/app_navigator.dart';
import 'package:weather/core/configs/assets/app_lottie.dart';
import 'package:weather/core/configs/theme/app_colors.dart';
import 'package:weather/presentations/home/pages/home.dart';
import 'package:weather/presentations/splash/bloc/splash_cubit.dart';
import 'package:weather/presentations/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is GoToHomePage) {
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: SafeArea(child: Center(child: Lottie.asset(AppLottie.windy))),
      ),
    );
  }
}
