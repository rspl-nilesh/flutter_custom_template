import 'package:example_app/feature/logger/domain/usecase/email_log_event_usecase.dart';
import 'package:example_app/feature/logger/domain/usecase/log_event_usecase.dart';
import 'package:example_app/feature/logger/presentation/bloc/logger_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(
      () => LogEventUsecase(flutterLogger: serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => EmailLogEventUseCase(
      flutterLogger: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LoggerBloc>(
    () => LoggerBloc(
      logEventUseCase: serviceLocator(),
      emailLogEventUseCase: serviceLocator(),
    ),
  );
}
