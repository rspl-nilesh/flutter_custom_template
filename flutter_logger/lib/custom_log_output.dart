import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:logger/logger.dart';

class CustomLogOutput implements LogOutput{
  final LogFileProvider logFileProvider;

  CustomLogOutput({required this.logFileProvider});
  @override
  void output(OutputEvent event) async{
    print('CustomLogOutput event received ${event.level} and message is ${event.lines} and first ${ event.lines.first}');
    final String _log = event.lines.join("    ");
    logFileProvider.insertLog(log: _log);
  }

  @override
  void destroy() {}

  @override
  void init() {}
}