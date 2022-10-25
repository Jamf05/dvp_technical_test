import 'package:dio/dio.dart';
import 'package:dvp_technical_test/core/api/api_provider.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future getAuth();
  Future login();
  Future signUp(Map<String, dynamic> params);
  Future logout();
  Future isAuthenticate();
  Future<UserModel> getCurrentUser();
  Future setCurrentUser();
  Future<void> registerUser(Map<String, dynamic> params);
  Future<void> updateUser(Map<String, dynamic> params);
}

class AuthRemoteDataSourceImpl extends ApiProvider implements AuthRemoteDataSource {

  @override
  Future getAuth() {
    // TODO: implement getAuth
    throw UnimplementedError();
  }

  @override
  Future login() {
    // TODO: implement isAuthenticate
    throw UnimplementedError();
  }

  @override
  Future isAuthenticate() {
    // TODO: implement isAuthenticate
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future setCurrentUser() {
    // TODO: implement setCurrentUser
    throw UnimplementedError();
  }

  @override
  Future signUp(Map<String, dynamic> params) async {
    // TODO: implement signUp
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      const String path = 'https://wl4mwssh7d.execute-api.us-east-1.amazonaws.com/prod/user';
      final response = await dio.get(path);
      return UserModel.fromJson((response.data["BODY"]["USER"] as List).first);
    } on DioError catch (error) {
      throw DioFailure.decode(error);
    }
  }

  @override
  Future<void> registerUser(Map<String, dynamic> params) async {
    try {
      const String path = 'https://wl4mwssh7d.execute-api.us-east-1.amazonaws.com/prod/user';
      await dio.post(path, data: params);
    } on DioError catch (error) {
      throw DioFailure.decode(error);
    }
  }

  @override
  Future<void> updateUser(Map<String, dynamic> params) async {
    try {
      const String path = 'https://wl4mwssh7d.execute-api.us-east-1.amazonaws.com/prod/user';
      await dio.put(path, data: params);
    } on DioError catch (error) {
      throw DioFailure.decode(error);
    }
  }

}