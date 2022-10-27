import 'package:dvp_technical_test/core/database/database_helper.dart';
import 'package:dvp_technical_test/core/failures/error.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class AddressLocalDataSource {
  Future<bool> setAddress(AddressModel user);
  Future<List<AddressModel>?> getListAddress();
  Future<bool> removeAddress(AddressModel user);
  Future<bool> saveAddress(AddressModel user);
}

class AddressLocalDataSourceImpl implements AddressLocalDataSource {
  final AuthLocalDataSource authLocalDataSource;
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  AddressLocalDataSourceImpl({required this.authLocalDataSource});

  @override
  Future<List<AddressModel>?> getListAddress() async {
    try {
      List<AddressModel>? list = [];
      String orderBy = "created_at DESC";
      final res =
          await _databaseHelper.selectQuery("address", orderBy: orderBy);
      if (res != null && res.length > 0) {
        var listElement = List<Map<String, dynamic>>.generate(
            res.length, (index) => Map<String, dynamic>.from(res[index]),
            growable: true);
        for (var element in listElement) {
          final product = Map<String, dynamic>.from(element);
          list.add(AddressModel.fromQuery(product));
        }
      }
      return list;
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> removeAddress(AddressModel address) async {
    try {
      await _databaseHelper.execute(
        '''DELETE FROM address WHERE id = ${address.id}''',
      );
      final currentUser = await authLocalDataSource.getCurrentUser();
      final currentAddress = currentUser?.address;
      if (currentUser == null || currentAddress == null) return true;
      if (currentAddress.id == address.id) {
        await authLocalDataSource.setCurrentUser(
            currentUser.copyWithModel(address: const AddressModel()));
      }
      return true;
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> saveAddress(AddressModel address) async {
    try {
      await _databaseHelper.execute('''BEGIN TRANSACTION;''');
      await _databaseHelper.execute(
        '''UPDATE address SET selected = 0''',
      );
      await _databaseHelper.execute(
        '''INSERT OR REPLACE INTO address (id, name, selected) VALUES(${address.id}, '${address.name}', ${address.selected == true ? 1 : 0})''',
      );
      await _databaseHelper.execute('''COMMIT;''');
      UserModel? currentUser = await authLocalDataSource.getCurrentUser();
      if (currentUser != null) {
        currentUser = currentUser.copyWithModel(address: address);
        await authLocalDataSource.setCurrentUser(currentUser);
      }
      return true;
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> setAddress(AddressModel address) async {
    try {
      await _databaseHelper.execute('''UPDATE address SET selected = 0''',);
      String? where = "id = ${address.id}";
      await _databaseHelper.update("address", address.toQuery(), where, []);
      UserModel? currentUser = await authLocalDataSource.getCurrentUser();
      if (currentUser != null) {
        currentUser = currentUser.copyWithModel(address: address);
        await authLocalDataSource.setCurrentUser(currentUser);
      }
      return true;
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
