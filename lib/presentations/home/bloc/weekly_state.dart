import 'package:equatable/equatable.dart';
import 'package:weather/domain/weather/entities/weekly_weather.dart';

abstract class WeeklyState extends Equatable {}

class WeeklyLoading extends WeeklyState {
  @override
  List<Object?> get props => [];
}

class WeeklyFailureLoaded extends WeeklyState {
  final String errorMessage;
  WeeklyFailureLoaded({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class WeeklyLoad extends WeeklyState {
  final WeeklyEntity weekly;
  WeeklyLoad({required this.weekly});
  @override
  List<Object?> get props => [weekly];
}
