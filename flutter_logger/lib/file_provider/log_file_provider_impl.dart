import 'dart:io';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:path_provider/path_provider.dart';

class LogFileProviderImpl implements LogFileProvider {
  final LoggerConfig loggerConfig;

  LogFileProviderImpl({required this.loggerConfig});

  @override
  Future<String> createLogFile() async {
    final _dir = await getApplicationDocumentsDirectory();
    const String _fileName = "log.txt";
    final _file = await File("${_dir.path}/${_getDirName()}/$_fileName")
        .create(recursive: true);
    await loggerConfig.setLogFilePath(directory: _file.path);
    return _file.path;
  }

  String _getDirName() {
    final DateTime _currentDate = DateTime.now();
    return "${_currentDate.day}_${_currentDate.month}_${_currentDate.year}";
  }

  //@override
  Future<String> getLogFilePath() async {
    String _logFilePath = loggerConfig.getLogFilePath();
    if (loggerConfig.getLogFilePath().isEmpty ||
        !await File(_logFilePath).exists()) {
      return await createLogFile();
    }
    return _logFilePath;
  }

  @override
  Future<void> insertLog({required String log}) async {
    final logFile = File(await getLogFilePath());
    logFile.writeAsString(log, mode: FileMode.writeOnlyAppend,flush: true);
  }

}
