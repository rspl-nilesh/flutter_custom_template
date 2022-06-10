part of 'logger_bloc.dart';
class LoggerEvent extends Equatable {
  final Level level;
  final String message;

  LoggerEvent({required this.level,required this.message});

  @override
  List<Object?> get props => [level,message];
}
