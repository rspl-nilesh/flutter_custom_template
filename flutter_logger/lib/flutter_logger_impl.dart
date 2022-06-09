import 'package:flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:logger/logger.dart';
import 'package:flutter_logger/injection_container.dart' as di;

class FlutterLoggerImpl implements FlutterLogger {
  final Logger logger;
  final LoggerConfig config;

  FlutterLoggerImpl({required this.logger, required this.config});

  @override
  void logD({required Object classRef, required String message}) {
    logger.d(message);
    logger.e(message);
  }
}
