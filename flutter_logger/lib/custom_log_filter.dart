import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:logger/logger.dart';

class CustomLogFilter extends LogFilter {
  final LoggerConfig loggerConfig;

  CustomLogFilter({required this.loggerConfig});

  @override
  bool shouldLog(LogEvent event) {
    var shouldLog = false;
    print(
        'shouldLog ${event.level}\n ${loggerConfig.getLogLevels()} and ${loggerConfig.getLogLevels().contains(event.level)}');

    bool _isLevelSet() {
      return loggerConfig.getLogLevels().contains(event.level);
    }

    if (loggerConfig.getLogMode() == LogMode.prod && _isLevelSet()) {
      return true;
    }
    if (loggerConfig.getLogMode() == LogMode.debug) {
      assert(() {
        if (_isLevelSet()) {
          shouldLog = true;
        }
        return true;
      }());
    }
    return shouldLog;
  }
}
