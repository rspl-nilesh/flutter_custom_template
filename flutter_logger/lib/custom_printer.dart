import 'package:logger/logger.dart';

class CustomPrinter extends LogPrinter {
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
}
