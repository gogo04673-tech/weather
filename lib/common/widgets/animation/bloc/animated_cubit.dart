import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedCubit extends Cubit<double> {
  AnimatedCubit() : super(10);

  @override
  Future<void> close() {
    return super.close();
  }
}
