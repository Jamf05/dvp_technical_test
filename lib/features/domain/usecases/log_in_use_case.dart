import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

///
/// params
/// ```json
/// {
///   email: (String)
///   password: (String)
/// }
/// ```
///

class LogInUseCase implements UseCase<UserEntity?, Map<String, String>> {
  final AuthRepository authRepository;

  LogInUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity?>> call(Map<String, String> params) {
    return authRepository.logIn(params);
  }
}
