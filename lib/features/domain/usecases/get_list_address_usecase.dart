import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';

class GetListAddressUsecase implements UseCase<List<AddressEntity>?, NoParams> {
  final AddressRepository repository;
  GetListAddressUsecase(this.repository);
  @override
  Future<Either<Failure, List<AddressEntity>?>> call(NoParams np) {
    return repository.getListAddress();
  }
}
