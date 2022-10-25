import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/repositories/user_repository.dart';

class GetUserDataUseCase implements UseCase<bool, Map<String, dynamic>> {
  final UserRepository repository;
  GetUserDataUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(Map<String, dynamic> params) {
    return repository.getUserData(params);
  }
}
