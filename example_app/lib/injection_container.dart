import 'package:example_app/feature/logger/domain/usecase/log_event_usecase.dart';
import 'package:example_app/feature/logger/presentation/bloc/logger_bloc.dart';
import 'package:flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/flutter_logger_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {

  serviceLocator.registerLazySingleton(() => LogEventUsecase(flutterLogger: serviceLocator()));

  serviceLocator.registerFactory<LoggerBloc>(() => LoggerBloc(logEventUsecase: serviceLocator()));
}
