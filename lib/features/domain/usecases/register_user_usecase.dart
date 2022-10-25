import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class RegisterUserUseCase implements UseCase<UserEntity?, Map<String, dynamic>> {
  final AuthRepository authRepository;

  RegisterUserUseCase(this.authRepository);
  /// params:
  /// ```dart
  /// {
  ///   "userName": (String),
  ///   "surname": (String),
  ///   "phoneNumber": (String),
  ///   "email": (String),
  ///   "country": (String),
  ///   "city": (String),
  ///   "isChef": true,
  ///   "birthDay": (String),
  ///   "img": (String),
  ///   "userSub": (String),
  ///   "sessionStatus": (int)
  /// }
  /// ```
  @override
  Future<Either<Failure, UserEntity?>> call(Map<String, dynamic> params) {
    return authRepository.registerUser(params);
  }
}
