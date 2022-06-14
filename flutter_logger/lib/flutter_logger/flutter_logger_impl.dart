import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_logger/error/failure.dart';
import 'package:flutter_logger/file_provider/log_file_provider.dart';
import 'package:flutter_logger/flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:flutter_logger/response/resource.dart';
import 'package:flutter_logger/response/status.dart';
import 'package:logger/logger.dart';

class FlutterLoggerImpl implements FlutterLogger {
  final Logger logger;
  final LoggerConfig config;
  final LogFileProvider logFileProvider;

  FlutterLoggerImpl({required this.logger,
    required this.config,
    required this.logFileProvider});

  @override
  void logD({required Object classRef, required String message}) {
    logger.d(message);
    logger.e(message);
  }

  @override
  Future<Resource<String>> emailLog() async {
    final logFilePath = File(config.getLogFilePath());
    if (await logFilePath.exists()) {
      try {
        final Email email = Email(
          body: config.getLogEmailBody(),
          subject: config.getLogEmailSubject(),
          recipients: config.getLogRecipientMailIds(),
          attachmentPaths: [config.getLogFilePath()],
          isHTML: false,
        );

        await FlutterEmailSender.send(email);
        return Resource(status: STATUS.success);
      } on PlatformException catch (error) {
        return Resource(
          status: STATUS.error,
          failure: EmailLogFailure()
            ..message = error.toString(),
        );
      }
    } else {
      return Resource(
        status: STATUS.error,
        failure: EmailLogFailure()
          ..message = "No log file found",
      );
    }
  }

  @override
  Future<bool> clearTodaysLog() => logFileProvider.clearTodaysLog();

  @override
  Future<File?> zipLogFiles() => logFileProvider.zipLogFiles();

  @override
  Future<void> init() => logFileProvider.clearOldLogs();


}
