library flutter_logger;

import 'dart:io';

import 'package:flutter_logger/response/resource.dart';

abstract class FlutterLogger {
  void logD({required Object classRef, required String message});
  Future<Resource<String>> emailLog();
  Future<bool> clearTodaysLog();
  Future<File?>zipLogFiles();
  Future<void>init();
}
