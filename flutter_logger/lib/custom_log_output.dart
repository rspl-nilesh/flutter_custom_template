import 'package:logger/logger.dart';

class CustomLogOutput implements LogOutput{
  @override
  void output(OutputEvent event) {
    print('CustomLogOutput event received ${event.level} and message is ${event.lines}');
  }

  @override
  void destroy() {
    // TODO: implement destroy
  }

  @override
  void init() {
    // TODO: implement init
  }
}