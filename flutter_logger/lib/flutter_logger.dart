library flutter_logger;

import 'package:flutter_logger/configuration/logger_config.dart';

abstract class FlutterLogger {
  void logD({required Object classRef, required String message});
}
