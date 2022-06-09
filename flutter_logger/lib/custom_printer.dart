import 'package:logger/logger.dart';

class CustomPrinter implements LogPrinter {
  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    final DateTime dateTime = DateTime.now();
    return [
      emoji ?? "",
      event.message,
      dateTime.millisecondsSinceEpoch.toString()
    ];
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
