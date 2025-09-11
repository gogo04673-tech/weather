import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/configs/theme/app_theme.dart';
import 'package:weather/presentations/splash/bloc/splash_cubit.dart';
import 'package:weather/presentations/splash/pages/splash.dart';
import 'package:weather/services_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
