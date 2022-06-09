import 'package:logger/logger.dart';

enum LogMode { debug, prod }

abstract class LoggerConfig {
  Future<void> setAutoClear({required isAutoClear});

  bool isAutoClear();

  Future<void> setLogMode({required LogMode logMode});

  LogMode getLogMode();

  Future<void> setLogInFilesAllowed({required bool isAllowed});

  bool isLogInFilesAllowed();

  Future<void> setLogFileDirectory({required String directory});

  String getLogFileDirectory();

  Future<void> setAutoClearDuration({required int days});

  int getAutoClearDuration();

  Future<void> setLogLevels({required List<Level> levels});

  List<Level> getLogLevels();
}
