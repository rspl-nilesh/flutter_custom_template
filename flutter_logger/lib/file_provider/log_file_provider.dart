import 'dart:io';

abstract class LogFileProvider {
  Future<String> createLogFile();

  Future<void> insertLog({required String log});

  Future<bool> clearTodaysLog();

  Future<File?> zipLogFiles();

  Future<void> clearOldLogs();
}
