import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
class CustomPrinter implements LogPrinter {
  @override
  List<String> log(LogEvent event) {
    var emoji = PrettyPrinter.levelEmojis[event.level];
    final DateTime dateTime = DateTime.now();
    return [
      emoji ?? "",
      event.message,
      dateTime.toReadableTime()
    ];
  }

  @override
  void destroy() {}

  @override
  void init() {}
}
extension DateFormatter on DateTime{
  String toReadableTime(){
    return DateFormat("dd-MM-yyyy HH:mm:ss").format(this);
  }
}
