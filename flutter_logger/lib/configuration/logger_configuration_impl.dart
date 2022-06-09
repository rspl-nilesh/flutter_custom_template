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
const String _prefLogFileDirectory = "log_file_directory";

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
      DEFAULT_AUTO_CLEAR_DURATION;

  @override
  String getLogFileDirectory() {
    // TODO: implement getLogFileDirectory
    throw UnimplementedError();
  }

  @override
  List<Level> getLogLevels() {
    List<String> _defaultLevels = EnumToString.toList(DEFAULT_LOG_LEVELS);
    return EnumToString.fromList(Level.values,
            sharedPreference.getStringList(_prefLogLevels) ?? _defaultLevels)
        .map((e) => e!)
        .toList();
  }

  @override
  bool isLogInFilesAllowed() =>
      sharedPreference.getBool(_prefLogInFilesAllowed) ??
      DEFAULT_LOGS_IN_FILE_ALLOWED;

  @override
  Future<void> setAutoClearDuration({required int days}) async {
    await sharedPreference.setInt(_prefAutoClearDuration, days);
  }

  @override
  Future<void> setLogFileDirectory({required String directory}) async {
    await sharedPreference.setString(_prefLogFileDirectory, directory);
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
}
