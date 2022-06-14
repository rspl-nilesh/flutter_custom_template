import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:logger/logger.dart';

class CustomLogOutput implements LogOutput {
  final LogFileProvider logFileProvider;

  CustomLogOutput({required this.logFileProvider});

  @override
  void output(OutputEvent event) async {
    final String _log = event.lines.join("    ");
    logFileProvider.insertLog(log: "\n" + _log);
  }

  @override
  void destroy() {}

  @override
  void init() {}
}
