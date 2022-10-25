import 'package:dio/dio.dart';
import 'api_interceptors.dart';

class ApiProvider {
  late Dio dio;
  ApiProvider() {
    dio = Dio(BaseOptions());
    dio.interceptors.add(ApiInterceptors());
  }
}
