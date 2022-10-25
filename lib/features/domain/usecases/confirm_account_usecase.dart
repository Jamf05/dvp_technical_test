import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

/// params:
/// ```dart
/// {
///   "email": (String),
///   "confirmationCode": (String)
/// }
/// ```

class ConfirmAccountUsecase implements UseCase<bool?, Map<String, dynamic>> {
  final AuthRepository authRepository;

  ConfirmAccountUsecase(this.authRepository);

  @override
  Future<Either<Failure, bool?>> call(Map<String, dynamic> params) {
    return authRepository.confirmAccount(params);
  }
}
