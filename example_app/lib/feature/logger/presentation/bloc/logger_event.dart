part of 'logger_bloc.dart';

abstract class LoggerEvent extends Equatable {}

class AddLogEvent extends LoggerEvent {
  final Level level;
  final String message;

  AddLogEvent({required this.level, required this.message});

  @override
  List<Object?> get props => [level, message];
}

class EmailLogEvent extends LoggerEvent{
  @override
  List<Object?> get props => [];
}