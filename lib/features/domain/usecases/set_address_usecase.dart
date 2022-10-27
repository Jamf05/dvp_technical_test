import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';

class SetAddressUseCase implements UseCase<bool?, AddressEntity> {
  final AddressRepository repository;
  SetAddressUseCase(this.repository);
  @override
  Future<Either<Failure, bool?>> call(AddressEntity address) {
    return repository.setAddress(address);
  }
}
