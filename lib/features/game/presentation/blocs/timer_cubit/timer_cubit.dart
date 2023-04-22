import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TimerStatus { ticking, off }

class TimerCubit extends Cubit<int> {
  TimerCubit() : super(0);

  late Timer _timer;
  late TimerStatus timerStatus;

  void start() => {
        state > 0 ? {stop(), reset()} : emit(0),
        timerStatus = TimerStatus.ticking,
        _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
          emit(state + 100);
        })
      };
  void stop() => {
        _timer.cancel(),
        timerStatus = TimerStatus.off,
      };
  void reset() => {
        emit(0),
        timerStatus = TimerStatus.off,
      };
}
