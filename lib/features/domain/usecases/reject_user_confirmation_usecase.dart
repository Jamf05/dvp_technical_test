import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class RejectUserConfirmationUseCase implements UseCase<bool?, NoParams> {
  final AuthRepository authRepository;
  RejectUserConfirmationUseCase(this.authRepository);
  @override
  Future<Either<Failure, bool?>> call(NoParams np) {
    return authRepository.clearCurrentUser();
  }
}
