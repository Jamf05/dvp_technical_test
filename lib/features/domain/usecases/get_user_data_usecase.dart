import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';

class GetUserDataUseCase implements UseCase<UserEntity?, NoParams> {
  final AuthRepository repository;
  GetUserDataUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) {
    return repository.getCurrentUser();
  }
}
