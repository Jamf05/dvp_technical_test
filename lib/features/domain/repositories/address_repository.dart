import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';

abstract class AddressRepository {
  Future<Either<Failure, bool>> setAddress(AddressEntity address);
  Future<Either<Failure, List<AddressEntity>?>> getListAddress();
  Future<Either<Failure, bool>> removeAddress(AddressEntity address);
  Future<Either<Failure, bool>> saveAddress(AddressEntity address);
}