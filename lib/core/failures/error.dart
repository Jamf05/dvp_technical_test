import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';

class ErrorFailure extends Failure {
  final Error? error;
  @override
  final String? message;
  ErrorFailure._({
    this.error,
    this.message,
  });
  factory ErrorFailure.decode(Error? error,) {
    log(error.toString(), name: 'ERRORFAILURE');
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }
}

class HiveFailure extends Failure {
  final HiveError? error;
  @override
  final String? message;
  HiveFailure._({
    this.error,
    this.message,
  });
  factory HiveFailure.decode(HiveError? error) {
    log(error.toString(), name: 'HIVEFAILURE');
    log((error?.message).toString(), name: 'HIVEFAILURE-MESSAGE');
    return HiveFailure._(
      error: error,
      message: error?.message,
    );
  }
}