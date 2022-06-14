import 'dart:io';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:path_provider/path_provider.dart';

class LogFileProviderImpl implements LogFileProvider {
  final String _logFileIdentifier = "_log.txt";
  final LoggerConfig loggerConfig;

  LogFileProviderImpl({required this.loggerConfig});

  @override
  Future<String> createLogFile() async {
    final _dir = await getApplicationDocumentsDirectory();
    String _fileName = _getFileName();
    final _file =
    await File("${_dir.path}/logs/$_fileName").create(recursive: true);
    await loggerConfig.setLogFilePath(filePath: _file.path);
    return _file.path;
  }

  String _getFileName() {
    final DateTime _currentDate = DateTime.now();
    return "${_currentDate.day}_${_currentDate.month}_${_currentDate
        .year}$_logFileIdentifier";
  }

  String _getZipFileName() {
    final DateTime _currentDate = DateTime.now();
    return "${_currentDate.day}_${_currentDate.month}_${_currentDate.year}.zip";
  }

  Future<bool> _isLogFileExists() async {
    final _fileDir = File(loggerConfig.getLogFilePath()).parent.path;
    String _logFilePath = "$_fileDir/${_getFileName()}";
    return await File(_logFilePath).exists();
  }

  Future<String> _getLogFilePath() async {
    if (await _isLogFileExists() == false) {
      return await createLogFile();
    }
    return loggerConfig.getLogFilePath();
  }

  @override
  Future<void> insertLog({required String log}) async {
    final logFile = File(await _getLogFilePath());
    await logFile.writeAsString(log,
        mode: FileMode.writeOnlyAppend, flush: true);
  }

  @override
  Future<bool> clearTodaysLog() async {
    final _logFilePath = await _getLogFilePath();
    try {
      await File(_logFilePath).delete();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<File?> zipLogFiles() async {
    if (await _isLogFileExists()) {
      final _logFile = File(await _getLogFilePath());
      final dataDir = Directory(_logFile.parent.path);
      try {
        final zipFile = File(dataDir.path + "_" + _getZipFileName());
        await ZipFile.createFromDirectory(
            sourceDir: dataDir, zipFile: zipFile, recurseSubDirs: true);
        return zipFile;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> clearOldLogs() async {
    if (loggerConfig.isAutoClear()) {
      Directory _dir = File(loggerConfig.getLogFilePath()).parent;
      final _nonDeletableFiles = _nonDeletableFilesPath();
      if (_dir.existsSync() && _dir.listSync().isNotEmpty) {
        _dir.listSync().forEach((element) {
          if(!_nonDeletableFiles.contains(element.path)){
            element.delete();
          }
        });
      }
    }
  }

  List<String> _nonDeletableFilesPath() {
    List<String> nonDeletableFiles = [];
    DateTime _currentDate = DateTime.now();
    Directory _dir = File(loggerConfig.getLogFilePath()).parent;
    for (int i = loggerConfig.getAutoClearDuration(); i >= 0; i--) {
      DateTime _clearanceStartDate =
      DateTime(_currentDate.year, _currentDate.month, _currentDate.day - i);
      final _fileName = "${_clearanceStartDate.day}_${_clearanceStartDate
          .month}_${_clearanceStartDate.year}$_logFileIdentifier";
      nonDeletableFiles.add(_dir.path + "/" + _fileName);
    }
    return nonDeletableFiles;
  }
}
