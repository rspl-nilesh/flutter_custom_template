part of 'logger_bloc.dart';

abstract class LoggerState extends Equatable {
  const LoggerState();
}

class LoggerInitial extends LoggerState {
  @override
  List<Object> get props => [];
}
