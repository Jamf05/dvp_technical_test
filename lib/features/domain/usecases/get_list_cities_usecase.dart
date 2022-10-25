


import 'package:dartz/dartz.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';
import 'package:dvp_technical_test/features/domain/repositories/location_repository.dart';

class GetListCitiesUsecase implements UseCase<List<CityEntity>, Map<String, dynamic>> {
  final LocationRepository repository;
  GetListCitiesUsecase(this.repository);
  @override
  Future<Either<Failure, List<CityEntity>>> call(Map<String, dynamic> params) {
    return repository.listCities(params);
  }
}