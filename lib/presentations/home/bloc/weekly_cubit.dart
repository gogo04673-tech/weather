/*
params : {
  "lat": ,
  "long": ,
}
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/domain/weather/usecases/get_weekly_weather.dart';
import 'package:weather/presentations/home/bloc/weekly_state.dart';
import 'package:weather/services_locator.dart';

class WeeklyCubit extends Cubit<WeeklyState> {
  WeeklyCubit() : super(WeeklyLoading());

  void getData() async {
    Position pos = await Geolocator.getCurrentPosition();

    var returnDate = await sl<GetWeeklyWeatherUseCase>().call(
      params: {"lat": pos.latitude, "long": pos.longitude},
    );

    returnDate.fold(
      (error) {
        emit(WeeklyFailureLoaded(errorMessage: error));
      },
      (data) {
        emit(WeeklyLoad(weekly: data));
      },
    );
  }
}
