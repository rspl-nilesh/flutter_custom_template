import 'package:logger/logger.dart';

enum LogMode { debug, prod }

abstract class LoggerConfig {
  Future<void> setAutoClear({required isAutoClear});

  bool isAutoClear();

  Future<void> setLogMode({required LogMode logMode});

  LogMode getLogMode();

  Future<void> setLogInFilesAllowed({required bool isAllowed});

  bool isLogInFilesAllowed();

  Future<void> setLogFilePath({required String filePath});

  String getLogFilePath();

  Future<void> setAutoClearDuration({required int days});

  int getAutoClearDuration();

  Future<void> setLogLevels({required List<Level> levels});

  List<Level> getLogLevels();

  Future<void> setLogRecipientMailId({required List<String> emailIds});

  List<String> getLogRecipientMailIds();

  Future<void> setLogEmailBody({required String emailBody});

  String getLogEmailBody();

  Future<void> setLogEmailSubject({required String emailSubject});

  String getLogEmailSubject();
}
