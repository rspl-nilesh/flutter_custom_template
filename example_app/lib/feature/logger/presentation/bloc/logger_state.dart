part of 'logger_bloc.dart';

class LoggerState extends Equatable {
  final Resource<String>? sendEmailLogResource;

  const LoggerState({this.sendEmailLogResource});

  @override
  List<Object?> get props => [sendEmailLogResource];

  factory LoggerState.initial() {
    return const LoggerState();
  }

  LoggerState copy({Resource<String>? sendEmailLogResource}) {
    return LoggerState(
        sendEmailLogResource:
            sendEmailLogResource ?? this.sendEmailLogResource);
  }
}
