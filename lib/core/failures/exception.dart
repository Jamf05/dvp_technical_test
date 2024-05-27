import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqlite_api.dart';

class ExceptionFailure extends Failure {
  final Exception? error;
  @override
  final String? message;
  ExceptionFailure._({
    this.error,
    this.message,
  });
  factory ExceptionFailure.decode(Exception? error) {
    log(error.toString(), name: 'EXCEPTIONFAILURE');
    return ExceptionFailure._(
      error: error,
      message: error.toString(),
    );
  }
}

class DioFailure extends Failure {
  final int? statusCode;
  final Map? data;
  final DioException? error;
  @override
  final String? message;
  DioFailure._({
    this.statusCode,
    this.data,
    this.error,
    this.message,
  });
  factory DioFailure.decode(DioException? error,) {
    log(error.toString(), name: 'DIOFAILURE');
    log((error?.response?.statusCode).toString(), name: 'DIOFAILURE-STATUSCODE');
    log((error?.message).toString(), name: 'DIOFAILURE-MESSAGE');
    log((error?.response?.data).toString(), name: 'DIOFAILURE-DATA');
    return DioFailure._(
      error: error,
      statusCode: error?.response?.statusCode,
      message: error?.message,
      data: error?.response?.data,
    );
  }
}

class SqfliteFailure extends Failure {
  final DatabaseException? error;
  @override
  final String? message;
  SqfliteFailure._({
    this.error,
    this.message,
  });
  factory SqfliteFailure.decode(DatabaseException? error) {
    log(error.toString(), name: 'SQFLITEFAILURE');
    return SqfliteFailure._(
      error: error,
      message: error.toString(),
    );
  }
}

// class CognitoFailure extends Failure {
//   @override
//   final String? message;
//   final int? statusCode;
//   final CognitoClientException? error;

//   CognitoFailure._({
//     this.message,
//     this.statusCode,
//     this.error,
//   });

//   factory CognitoFailure.decode(CognitoClientException? error) {
//     log((error?.name).toString(), name: 'COGNITOFAILURE-ERROR');
//     log((error?.message).toString(), name: 'COGNITOFAILURE-MESSAGE');
//     log((error?.statusCode).toString(), name: 'COGNITOFAILURE-STATUSCODE');
//     return CognitoFailure._(
//       error: error,
//       message: error?.message,
//       statusCode: error?.statusCode
//     );
//   }
// }

class PlatformFailure extends Failure {
  @override
  final String? message;
  final PlatformException? error;

  PlatformFailure._({
    this.message,
    this.error,
  });

  factory PlatformFailure.decode(PlatformException? error) {
    log((error).toString(), name: 'PlatformFailure-ERROR');
    log((error?.message).toString(), name: 'PlatformFailure-MESSAGE');
    return PlatformFailure._(
      error: error,
      message: error?.message,
    );
  }
}