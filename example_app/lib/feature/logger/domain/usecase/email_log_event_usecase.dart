import 'package:example_app/usecase.dart';
import 'package:flutter_logger/flutter_logger/flutter_logger.dart';
import 'package:flutter_logger/response/resource.dart';

class EmailLogEventUseCase extends UseCase<Resource<String>, void> {
  final FlutterLogger flutterLogger;

  EmailLogEventUseCase({required this.flutterLogger});

  @override
  Future<Resource<String>> call(void params) => flutterLogger.emailLog();
}
