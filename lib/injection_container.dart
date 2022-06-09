import 'package:example_app/injection_container.dart' as example_injector;
import 'package:flutter_logger/injection_container.dart' as logger_injector;
import 'package:get_it/get_it.dart';
final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  //Remove, when flutter logger not included in project
  await logger_injector.init();

  //Remove, when example app not included in project
  await example_injector.init();
}
