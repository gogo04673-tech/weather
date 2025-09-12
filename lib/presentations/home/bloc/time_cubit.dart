import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentations/home/bloc/time_state.dart';

class TimeCubit extends Cubit<ClockState> {
  TimeCubit() : super(ClockState(currentTime: _formatHour(DateTime.now()))) {
    _startHourlyTimer();
  }
  DateTime? timeNow;
  Timer? timer;

  static DateTime _formatHour(DateTime time) {
    return time;
  }

  void _startHourlyTimer() {
    DateTime now = DateTime.now();
    timeNow = DateTime.now();

    // احسب الوقت المتبقي للساعة الجاية
    int secondsToNextHour = 60 - now.second;

    // أول مؤقت يوصل للساعة الجاية بالضبط
    Timer(Duration(seconds: secondsToNextHour), () {
      timeNow = DateTime.now();
      emit(ClockState(currentTime: _formatHour(DateTime.now())));

      // بعدين كل ساعة يحدث الحالة
      timer = Timer.periodic(const Duration(minutes: 1), (timer) {
        timeNow = DateTime.now();
        emit(ClockState(currentTime: _formatHour(DateTime.now())));
      });
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
