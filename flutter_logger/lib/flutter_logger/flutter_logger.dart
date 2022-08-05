library flutter_logger;

import 'dart:io';

import 'package:flutter_logger/response/resource.dart';

abstract class FlutterLogger {
  void logD({required String message});
  void logE({required String message});
  void logI({required String message});
  void logW({required String message});
  Future<Resource<String>> emailLog();
  Future<bool> clearTodaysLog();
  Future<File?>zipLogFiles();
  Future<void>init();
}
