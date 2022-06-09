import 'package:logger/logger.dart';

class CustomLogOutput extends LogOutput{
  @override
  void output(OutputEvent event) {
    print('CustomLogOutput event received ${event.level} and message is ${event.lines}');
  }
}