import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class ResendConfirmatioCodeUsecase
    implements UseCase<bool?, Map<String, dynamic>> {
  final AuthRepository authRepository;
  ResendConfirmatioCodeUsecase(this.authRepository);

  /// params:
  /// ```dart
  /// {
  ///   "email": (String),
  /// }
  /// ```
  @override
  Future<Either<Failure, bool?>> call(Map<String, dynamic> params) {
    return authRepository.resendConfirmationCode(params);
  }
}
