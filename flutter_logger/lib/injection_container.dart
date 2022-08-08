import 'package:flutter_logger/configuration/logger_configuration_impl.dart';
import 'package:flutter_logger/custom_log_filter.dart';
import 'package:flutter_logger/custom_log_output.dart';
import 'package:flutter_logger/custom_printer.dart';
import 'package:flutter_logger/file_provider/log_file_provider_impl.dart';
import 'package:flutter_logger/flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/flutter_logger/flutter_logger_impl.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'file_provider/log_file_provider.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<LoggerConfig>(
      () => LoggerConfigurationImpl(sharedPreference: serviceLocator()));

  serviceLocator.registerLazySingleton<LogPrinter>(() => CustomPrinter());

  serviceLocator.registerLazySingleton<LogFilter>(
      () => CustomLogFilter(loggerConfig: serviceLocator()));

  serviceLocator.registerLazySingleton<LogFileProvider>(
      () => LogFileProviderImpl(loggerConfig: serviceLocator()));

  serviceLocator.registerLazySingleton<LogOutput>(
    () => CustomLogOutput(
      logFileProvider: serviceLocator(),
      loggerConfig: serviceLocator()
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Logger(
      printer: serviceLocator(),
      filter: serviceLocator(),
      output: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FlutterLogger>(
    () => FlutterLoggerImpl(
      logger: serviceLocator(),
      config: serviceLocator(),
      logFileProvider: serviceLocator(),
    )..init(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
