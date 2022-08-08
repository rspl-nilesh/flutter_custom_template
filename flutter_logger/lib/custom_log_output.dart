import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:logger/logger.dart';

class CustomLogOutput implements LogOutput {
  final LogFileProvider logFileProvider;
  final LoggerConfig loggerConfig;

  CustomLogOutput({required this.logFileProvider, required this.loggerConfig});

  @override
  void output(OutputEvent event) async {
    final String _log = event.lines.join("    ");
    if(loggerConfig.isLogInFilesAllowed()) {
      logFileProvider.insertLog(log: "\n" + _log);
    }
  }

  @override
  void destroy() {}

  @override
  void init() {}
}
