import 'package:dio/dio.dart';
import 'package:dvp_technical_test/core/api/api_provider.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:dvp_technical_test/features/data/models/city_model.dart';
import 'package:dvp_technical_test/features/data/models/country_model.dart';
import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';

abstract class LocationRemoteDataSource {
  Future<List<CountryModel>> listCountries(Map<String, dynamic> params);
  Future<List<CityEntity>> listCities(Map<String, dynamic> params);
}

class LocationRemoteDataSourceImpl extends ApiProvider
    implements LocationRemoteDataSource {
  @override
  Future<List<CountryModel>> listCountries(Map<String, dynamic> params) async {
    try {
      const String path =
          'https://wl4mwssh7d.execute-api.us-east-1.amazonaws.com/prod/countries';
      final response = await dio.post(path, data: params);
      return (response.data["BODY"]["COUNTRIES"] as List)
          .map((e) => CountryModel.fromJson(e))
          .toList();
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    }
  }

  @override
  Future<List<CityEntity>> listCities(Map<String, dynamic> params) async {
    try {
      const String path =
          'https://wl4mwssh7d.execute-api.us-east-1.amazonaws.com/prod/cities';
      final response = await dio.post(path, data: params);
      return (response.data["BODY"]["CITIES"] as List)
          .map((e) => CityModel.fromJson(e))
          .toList();
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    }
  }
}
