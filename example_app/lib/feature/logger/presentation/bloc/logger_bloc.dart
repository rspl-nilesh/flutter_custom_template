import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_app/feature/logger/domain/usecase/log_event_usecase.dart';
import 'package:logger/logger.dart';

part 'logger_event.dart';

part 'logger_state.dart';

class LoggerBloc extends Bloc<LoggerEvent, LoggerState> {
  final LogEventUsecase logEventUsecase;

  LoggerBloc({required this.logEventUsecase}) : super(LoggerInitial()) {
    on<LoggerEvent>((event, emit) {
      logEventUsecase(LogParams(level: event.level, message: event.message));
    });
  }
}
