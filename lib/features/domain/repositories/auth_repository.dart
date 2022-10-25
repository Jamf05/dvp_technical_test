import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> logIn(Map<String, dynamic> params);
  Future<Either<Failure, bool?>> signUp(Map<String, dynamic> params);
  Future<Either<Failure, bool?>> logOut();
  Future<Either<Failure, UserEntity?>> checkAuthenticated();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, bool?>> setCurrentUser();
  Future<Either<Failure, bool?>> clearCurrentUser();
  Future<Either<Failure, bool?>> confirmAccount(Map<String, dynamic> params);
  Future<Either<Failure, bool?>> resendConfirmationCode(Map<String, dynamic> params);
  Future<Either<Failure, UserEntity?>> registerUser(Map<String, dynamic> params);
}