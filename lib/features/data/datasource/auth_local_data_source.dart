import 'package:dvp_technical_test/core/database/collections_name.dart';
import 'package:dvp_technical_test/core/failures/error.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> setCurrentUser(UserModel user);
  Future<UserModel?> getCurrentUser();
  Future<bool> clearCurrentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final Box<UserEntity> userBox =
          Hive.box<UserEntity>(HiveCollections.user);
      return UserModel.cast(userBox.get("user"));
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> setCurrentUser(UserModel user) async {
    try {
      final userBox = Hive.box<UserEntity>(HiveCollections.user);
      await userBox.put("user", user);
      return true;
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> clearCurrentUser() async {
    try {
      final userBox = Hive.box<UserEntity>(HiveCollections.user);
      await userBox.delete("user");
      return true;
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
