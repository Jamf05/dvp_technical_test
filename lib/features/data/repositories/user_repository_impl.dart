import 'dart:developer';

import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/features/data/datasource/user_remote_data_source.dart';
import 'package:dvp_technical_test/features/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userApiSource;
  UserRepositoryImpl(this._userApiSource);

  @override
  Future<Either<Failure, bool>> getUserData(Map<String, dynamic> params) {
    log(_userApiSource.toString());
    throw UnimplementedError();
  }
}
