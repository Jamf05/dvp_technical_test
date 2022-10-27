import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> checkAuthenticated();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, bool?>> setCurrentUser(UserEntity? user);
  Future<Either<Failure, bool?>> clearCurrentUser();
}