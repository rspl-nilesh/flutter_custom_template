import 'package:flutter_logger/configuration/logger_configuration_impl.dart';
import 'package:flutter_logger/custom_log_filter.dart';
import 'package:flutter_logger/custom_log_output.dart';
import 'package:flutter_logger/custom_printer.dart';
import 'package:flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/flutter_logger_impl.dart';
import 'package:flutter_logger/configuration/logger_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<LoggerConfig>(
      () => LoggerConfigurationImpl(sharedPreference: serviceLocator()));

  serviceLocator.registerLazySingleton<CustomPrinter>(() => CustomPrinter());

  serviceLocator.registerLazySingleton<CustomLogFilter>(
      () => CustomLogFilter(loggerConfig: serviceLocator()));

  serviceLocator
      .registerLazySingleton<CustomLogOutput>(() => CustomLogOutput());

  serviceLocator.registerLazySingleton(
    () => Logger(
      printer: CustomPrinter(),
      filter: CustomLogFilter(loggerConfig: serviceLocator()),
      output: CustomLogOutput(),
    ),
  );

  serviceLocator.registerLazySingleton<FlutterLogger>(() =>
      FlutterLoggerImpl(logger: serviceLocator(), config: serviceLocator()));

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
