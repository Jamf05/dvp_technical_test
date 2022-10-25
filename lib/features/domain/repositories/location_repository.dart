import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';
import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<CountryEntity>>> listCountries(
      Map<String, dynamic> params);
  Future<Either<Failure, List<CityEntity>>> listCities(
      Map<String, dynamic> params);
}
