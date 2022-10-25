import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/location_repository.dart';

class GetListCountriesUsecase implements UseCase<List<CountryEntity>, Map<String, dynamic>> {
  final LocationRepository repository;
  GetListCountriesUsecase(this.repository);
  @override
  Future<Either<Failure, List<CountryEntity>>> call(Map<String, dynamic> params) {
    return repository.listCountries(params);
  }
}
