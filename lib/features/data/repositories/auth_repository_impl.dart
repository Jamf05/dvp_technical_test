import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_remote_data_source.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final response = await authLocalDataSource.getCurrentUser();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> checkAuthenticated() async {
    try {
      final user = await authLocalDataSource.getCurrentUser();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> setCurrentUser(UserEntity? user) async {
    try {
      final response = await authLocalDataSource.setCurrentUser(UserModel.cast(user));
      return Right(response);
    } on Failure catch (server) {
      return Left(server);
    }
  }

  @override
  Future<Either<Failure, bool>> clearCurrentUser() async {
    try {
      await authLocalDataSource.clearCurrentUser();
      return const Right(true);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}