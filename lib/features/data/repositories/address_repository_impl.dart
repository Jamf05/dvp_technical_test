import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/features/data/datasource/address_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressLocalDataSource localDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AddressRepositoryImpl({
    required this.localDataSource,
    required this.authLocalDataSource,
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
      final currentUser = await authLocalDataSource.getCurrentUser();
      final currentAddress = currentUser?.address;
      if (currentUser == null || currentAddress == null) return Right(response);
      if (currentAddress.id == address.id) {
        final response2 = await authLocalDataSource.setCurrentUser(
            currentUser.copyWithModel(address: const AddressModel()));
        return Right(response && response2);
      }
      return const Right(false);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> saveAddress(AddressEntity address) async {
    try {
      final response =
          await localDataSource.saveAddress(AddressModel.cast(address));
      if (response) {
        UserModel? currentUser = await authLocalDataSource.getCurrentUser();
        if (currentUser != null) {
          currentUser =
              currentUser.copyWithModel(address: AddressModel.cast(address));
          final response2 =
              await authLocalDataSource.setCurrentUser(currentUser);
          return Right(response && response2);
        }
      }
      return const Right(false);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> setAddress(AddressEntity address) async {
    try {
      final response =
          await localDataSource.setAddress(AddressModel.cast(address));
      if (response) {
        if(address.selected == true) {
          UserModel? currentUser = await authLocalDataSource.getCurrentUser();
          if (currentUser != null) {
            currentUser =
                currentUser.copyWithModel(address: AddressModel.cast(address));
            final response2 =
                await authLocalDataSource.setCurrentUser(currentUser);
            return Right(response && response2);
          }
        }
      }
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
