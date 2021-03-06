import 'package:equatable/equatable.dart';
import 'package:flutter_logger/error/failure.dart';
import 'package:flutter_logger/response/status.dart';

class Resource<T> extends Equatable {
  STATUS? status;
  T? data;
  Failure? failure;

  Resource({this.status, this.data, this.failure});

  static Resource success({data}) =>
      Resource(status: STATUS.success, data: data);

  static Resource loading() => Resource(status: STATUS.loading);

  static Resource error({required Failure failure}) =>
      Resource(status: STATUS.error, failure: failure);

  @override
  List<Object?> get props => [status, data, failure];

  @override
  String toString() {
    return 'Resource{status: $status, data: $data, message: $failure}';
  }
}
