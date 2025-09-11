import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/permission/permissions.dart';
import 'package:weather/presentations/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted(context) async {
    await Future.delayed(const Duration(seconds: 4));

    requestPermissionLocation(context);

    emit(GoToHomePage());
  }
}
