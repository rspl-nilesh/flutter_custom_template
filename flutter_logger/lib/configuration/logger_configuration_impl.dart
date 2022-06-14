import 'package:flutter_logger/configuration/default_config_values.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:logger/src/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

const String _prefAutoClear = "auto_clear";
const String _prefLogMode = "log_mode";
const String _prefAutoClearDuration = "auto_clear_duration";
const String _prefLogLevels = "log_levels";
const String _prefLogInFilesAllowed = "log_in_files_allowed";
const String _prefLogFilePath = "log_file_path";
const String _prefLogEmailRecipientIds = "recipient_ids";
const String _prefLogEmailBody = "email_body";
const String _prefLogEmailSubject = "email_subject";

class LoggerConfigurationImpl implements LoggerConfig {
  final SharedPreferences sharedPreference;

  LoggerConfigurationImpl({required this.sharedPreference});

  @override
  bool isAutoClear() => sharedPreference.getBool(_prefAutoClear) ?? false;

  @override
  Future<void> setAutoClear({required isAutoClear}) async {
    await sharedPreference.setBool(_prefAutoClear, isAutoClear);
  }

  @override
  LogMode getLogMode() =>
      EnumToString.fromString(
          LogMode.values,
          sharedPreference.getString(_prefLogMode) ??
              LogMode.debug.toString()) ??
      LogMode.debug;

  @override
  Future<void> setLogMode({required LogMode logMode}) async {
    await sharedPreference.setString(
        _prefLogMode, EnumToString.convertToString(logMode));
  }

  @override
  int getAutoClearDuration() =>
      sharedPreference.getInt(_prefAutoClearDuration) ??
      defaultAutoClearDuration;

  @override
  String getLogFilePath() => sharedPreference.getString(_prefLogFilePath) ?? "";

  @override
  List<Level> getLogLevels() {
    List<String> _defaultLevels = EnumToString.toList(defaultLogLevels);
    return EnumToString.fromList(Level.values,
            sharedPreference.getStringList(_prefLogLevels) ?? _defaultLevels)
        .map((e) => e!)
        .toList();
  }

  @override
  bool isLogInFilesAllowed() =>
      sharedPreference.getBool(_prefLogInFilesAllowed) ??
      defaultLogsInFileAllowed;

  @override
  Future<void> setAutoClearDuration({required int days}) async {
    await sharedPreference.setInt(_prefAutoClearDuration, days);
  }

  @override
  Future<void> setLogFilePath({required String filePath}) async {
    await sharedPreference.setString(_prefLogFilePath, filePath);
  }

  @override
  Future<void> setLogInFilesAllowed({required bool isAllowed}) async {
    await sharedPreference.setBool(_prefLogInFilesAllowed, isAllowed);
  }

  @override
  Future<void> setLogLevels({required List<Level> levels}) async {
    List<String> _levelStrings = EnumToString.toList(Level.values);
    await sharedPreference.setStringList(_prefLogLevels, _levelStrings);
  }

  @override
  Future<void> setLogRecipientMailId({required List<String> emailIds}) async {
    await sharedPreference.setStringList(_prefLogEmailRecipientIds, emailIds);
  }

  @override
  List<String> getLogRecipientMailIds() =>
      sharedPreference.getStringList(_prefLogEmailRecipientIds) ?? List.empty();

  @override
  Future<void> setLogEmailBody({required String emailBody}) async {
    sharedPreference.setString(_prefLogEmailBody, emailBody);
  }

  @override
  String getLogEmailBody() =>
      sharedPreference.getString(_prefLogEmailBody) ?? "";

  @override
  String getLogEmailSubject() =>
      sharedPreference.getString(_prefLogEmailSubject) ?? "";

  @override
  Future<void> setLogEmailSubject({required String emailSubject}) async {
    await sharedPreference.setString(_prefLogEmailSubject, emailSubject);
  }
}
