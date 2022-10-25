import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/data/datasource/location_remote_datasource.dart';
import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';
import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CountryEntity>>> listCountries(
      Map<String, dynamic> params) async {
    try {
      final response = await remoteDataSource.listCountries(params);
      return Right(response);
    } on Failure catch (server) {
      return Left(server);
    }
  }

  @override
  Future<Either<Failure, List<CityEntity>>> listCities(
      Map<String, dynamic> params) async {
    try {
      final response = await remoteDataSource.listCities(params);
      return Right(response);
    } on Failure catch (server) {
      return Left(server);
    }
  }
}
