import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_app/feature/logger/domain/usecase/email_log_event_usecase.dart';
import 'package:example_app/feature/logger/domain/usecase/log_event_usecase.dart';
import 'package:example_app/usecase.dart';
import 'package:flutter_logger/response/resource.dart';
import 'package:flutter_logger/response/status.dart';
import 'package:logger/logger.dart';

part 'logger_event.dart';

part 'logger_state.dart';

class LoggerBloc extends Bloc<LoggerEvent, LoggerState> {
  final LogEventUsecase logEventUseCase;
  final EmailLogEventUseCase emailLogEventUseCase;

  LoggerBloc(
      {required this.logEventUseCase, required this.emailLogEventUseCase})
      : super(LoggerState.initial()) {
    on<LoggerEvent>((event, emit)async {
      if (event is AddLogEvent) {
        logEventUseCase(LogParams(level: event.level, message: event.message));
      }
      if (event is EmailLogEvent) {
        emit(
          state.copy(
            sendEmailLogResource: Resource(status: STATUS.loading),
          ),
        );
        final _result = await emailLogEventUseCase(NoParams());
        emit(state.copy(sendEmailLogResource: _result));
      }
    });
  }
}
