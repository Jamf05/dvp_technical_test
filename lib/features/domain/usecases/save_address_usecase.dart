import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';

class SaveAddressUseCase implements UseCase<bool?, AddressEntity> {
  final AddressRepository repository;
  SaveAddressUseCase(this.repository);
  @override
  Future<Either<Failure, bool?>> call(AddressEntity address) {
    return repository.saveAddress(address);
  }
}
