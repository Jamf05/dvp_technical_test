import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class SetUserUseCase implements UseCase<bool?, UserEntity?> {
  final AuthRepository authRepository;

  SetUserUseCase(this.authRepository);
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
  ///   "birthday": (String),
  ///   "img": (String),
  ///   "userSub": (String),
  ///   "sessionStatus": (int)
  /// }
  /// ```
  @override
  Future<Either<Failure, bool?>> call(UserEntity? user) {
    return authRepository.setCurrentUser(user);
  }
}
