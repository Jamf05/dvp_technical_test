import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_remote_data_source.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';
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
    SessionStatus? status = SessionStatus.unknown;
    try {
      // await _cognitoDataSource.init();
      final response1 = true;// await _cognitoDataSource.checkAuthenticated();
      final response2 = await authLocalDataSource.getSessionStatus();
      UserModel? user = const UserModel();
      if(response1 == true){
        status = SessionStatus.enabledConfirmed;
        switch (response2) {
          case SessionStatus.enabledConfirmed:
            user = await authLocalDataSource.getCurrentUser();
            status = response2;
            break;
          case SessionStatus.waitingToCompleteRegistration:
            status = response2;
            break;
          case SessionStatus.enabledUnconfirmed:
            status = response2;
            break;
          default: status = SessionStatus.inactive;
        }
      } else {status = SessionStatus.inactive;}
      return Right(user?.copyWith(status: status));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logIn(Map<String, dynamic> params) async {
    try {
      await authLocalDataSource.setToken("response1?.token");
      await authLocalDataSource.setUserId("response1?.id");
      final response2 = await authRemoteDataSource.getCurrentUser();
      UserModel user = response2.copyWithModel(id: "response1?.id", status: response2.status);
      await authLocalDataSource.setCurrentUser(user.toJson());
      return Right(user);
    } on Failure catch (e) {
      await logOut();
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      // Token and session status
      await authLocalDataSource.logOut();
      return const Right(true);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> setCurrentUser() {
    // TODO: implement setCurrentUser
    throw UnimplementedError();
  }

  /// params:
  /// ```json
  /// {
  ///   "email": (String),
  ///   "password": (String),
  ///   "birthdate": (String),
  ///   "user_name": (String),
  /// }
  /// ```
  /// 

  @override
  Future<Either<Failure, bool>> signUp(Map<String, dynamic> params) async {
    try {
      params.remove("password");
      if(true) {
        params["session_status"] = SessionStatus.waitingToCompleteRegistration.value.toString();
      } else {
        params["session_status"] = SessionStatus.enabledUnconfirmed.value.toString();
      }
      await authLocalDataSource.setUserId("response1?.userSub");
      await authLocalDataSource.setCurrentUser(params);
      params.remove("session_status");
      params.remove("confirmemail");
      params.remove("password");
      params.remove("confirmPassword");
      // await authRemoteDataSource.registerUser(params);
      return const Right(true);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserModel?>> registerUser(Map<String, dynamic> params) async {
    try {
      final userSub = await authLocalDataSource.getUserId();
      params["userSub"] = userSub;
      await authRemoteDataSource.registerUser(params);
      params["session_status"] = SessionStatus.enabledConfirmed.value.toString();
      await authLocalDataSource.setCurrentUser(params);
      final response = await authLocalDataSource.getCurrentUser();
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

  @override
  Future<Either<Failure, bool>> confirmAccount(Map<String, dynamic> params) async {
    try {
      if(true){
        String? id = await authLocalDataSource.getUserId();
        await authLocalDataSource.setSessionStatus(id: id, status: SessionStatus.waitingToCompleteRegistration);
        await authLocalDataSource.setToken("user?.token");
      }
      return const Right(true);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> resendConfirmationCode(Map<String, dynamic> params) async {
    try {
      return const Right(true);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}