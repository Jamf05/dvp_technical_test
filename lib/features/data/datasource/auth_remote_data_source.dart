import 'package:dvp_technical_test/core/api/api_provider.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future setCurrentUser();
  Future<void> updateUser(Map<String, dynamic> params);
  Future<void> removeUser(Map<String, dynamic> params);
}

class AuthRemoteDataSourceImpl extends ApiProvider implements AuthRemoteDataSource {
  @override
  Future<UserModel> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeUser(Map<String, dynamic> params) {
    throw UnimplementedError();
  }

  @override
  Future setCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(Map<String, dynamic> params) {
    throw UnimplementedError();
  }
}