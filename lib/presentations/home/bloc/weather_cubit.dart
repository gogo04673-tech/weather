import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/domain/weather/usecases/get_weather.dart';
import 'package:weather/presentations/home/bloc/weather_state.dart';
import 'package:weather/services_locator.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  Position? pos;

  void getData() async {
    pos = await Geolocator.getCurrentPosition();

    if (pos == null) {
      emit(WeatherFailureLoaded(errorMessage: "pos is null"));
    }

    var returnData = await sl<GetWeatherUseCase>().call(params: pos);

    returnData.fold(
      (error) {
        emit(WeatherFailureLoaded(errorMessage: error));
      },
      (data) async {
        List<Placemark> placemark = await placemarkFromCoordinates(
          pos!.latitude,
          pos!.longitude,
        );

        Placemark place = placemark.first;

        emit(WeatherLoad(weather: data, place: place));
      },
    );
  }
}
