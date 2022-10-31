import 'package:dvp_technical_test/core/database/database_helper.dart';
import 'package:dvp_technical_test/core/failures/error.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class AddressLocalDataSource {
  Future<bool> setAddress(AddressModel user);
  Future<List<AddressModel>?> getListAddress();
  Future<bool> removeAddress(AddressModel user);
  Future<bool> saveAddress(AddressModel user);
}

class AddressLocalDataSourceImpl implements AddressLocalDataSource {
  final DatabaseHelper databaseHelper;
  AddressLocalDataSourceImpl({required this.databaseHelper});
  @override
  Future<List<AddressModel>?> getListAddress() async {
    try {
      List<AddressModel>? list = [];
      String orderBy = "created_at DESC";
      final res =
          await databaseHelper.select("address", orderBy: orderBy);
      if (res != null && res.isNotEmpty) {
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
      await databaseHelper.execute(
        '''DELETE FROM address WHERE id = ${address.id}''',
      );
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
      await databaseHelper.execute('''BEGIN TRANSACTION;''');
      await databaseHelper.execute(
        '''UPDATE address SET selected = 0''',
      );
      await databaseHelper.execute(
        '''INSERT OR REPLACE INTO address (id, name, selected) VALUES(${address.id}, '${address.name}', ${address.selected == true ? 1 : 0})''',
      );
      await databaseHelper.execute('''COMMIT;''');
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
      if(address.selected == true) {
        await databaseHelper.execute('''UPDATE address SET selected = 0''',);
      }
      String? where = "id = ${address.id}";
      await databaseHelper.update("address", address.toQuery(), where, []);
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
