

import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> getUserData(Map<String, dynamic> params);
}