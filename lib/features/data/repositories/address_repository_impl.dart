import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/features/data/datasource/address_local_data_source.dart';
import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressLocalDataSource localDataSource;
  AddressRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<AddressEntity>?>> getListAddress() async {
    try {
      final response = await localDataSource.getListAddress();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> removeAddress(AddressEntity address) async {
    try {
      final response =
          await localDataSource.removeAddress(AddressModel.cast(address));
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> saveAddress(AddressEntity address) async {
    try {
      final response =
          await localDataSource.saveAddress(AddressModel.cast(address));
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> setAddress(AddressEntity address) async {
    try {
      final response =
          await localDataSource.setAddress(AddressModel.cast(address));
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
