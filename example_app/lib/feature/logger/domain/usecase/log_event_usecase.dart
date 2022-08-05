import 'package:example_app/usecase.dart';
import 'package:flutter_logger/flutter_logger/flutter_logger.dart';
import 'package:logger/logger.dart';

class LogEventUsecase extends UseCase<void, LogParams> {
  final FlutterLogger flutterLogger;

  LogEventUsecase({required this.flutterLogger});

  @override
  Future<void> call(LogParams params) async {
    switch (params.level) {
      case Level.error:{
          flutterLogger.logE(message: params.message);
          break;
        }
      case Level.info: {
        flutterLogger.logI(message: params.message);
        break;
      }
      case Level.warning: {
        flutterLogger.logW(message: params.message);
        break;
      }
      default : flutterLogger.logD(message: params.message);
    }
  }
}

class LogParams {
  final Level level;
  final String message;

  LogParams({required this.level, required this.message});
}
