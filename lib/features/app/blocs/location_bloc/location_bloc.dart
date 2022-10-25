import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';
import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_list_cities_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_list_countries_usecase.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetListCountriesUsecase _getListCountriesUsecase;
  final GetListCitiesUsecase _getListCitiesUseCase;

  LocationBloc(
      {required GetListCountriesUsecase getListCountriesUsecase,
      required GetListCitiesUsecase getListCitiesUseCase})
      : _getListCountriesUsecase = getListCountriesUsecase,
        _getListCitiesUseCase = getListCitiesUseCase,
        super(LocationInitialState()) {
    on<GetListCountriesEvent>(_mapGetListCountriesEventToState);
    on<GetListCitiesEvent>(_mapGetListCitiesEventToState);
    on<UpdateInputSearchCityEvent>(_mapUpdateInputSearchCitiesToState);
    on<UpdateInputSearchCountryEvent>(_mapUpdateInputSearchCountryToState);
  }

  bool _loadingData = false;
  bool get loadingData => _loadingData;
  final bool _sendingData = false;
  bool get sendingData => _sendingData;

  List<CountryEntity> listCountry = <CountryEntity>[];
  List<CityEntity> listCity = <CityEntity>[];

  CountryEntity? selectedCountry;
  CityEntity? selectedCity;

  void _mapUpdateInputSearchCountryToState(
      UpdateInputSearchCountryEvent event, Emitter<LocationState> emit) async {
    emit(LocationInitialState());
    emit(UpdateInputSearchCountryState());
  }

  void _mapUpdateInputSearchCitiesToState(
      UpdateInputSearchCityEvent event, Emitter<LocationState> emit) async {
    emit(LocationInitialState());
    emit(UpdateInputSearchCitiesState());
  }

  void _mapGetListCountriesEventToState(
      GetListCountriesEvent event, Emitter<LocationState> emit) async {
    _loadingData = true;
    emit(LocationInitialState());
    emit(UpdateInputSearchCountryState());
    Map<String, dynamic> params = {"country": event.query};
    final response = await _getListCountriesUsecase.call(params);
    response.fold((l) => event.show.eitherError(l), (r) => listCountry = r);
    _loadingData = false;
    emit(LocationInitialState());
    emit(UpdateInputSearchCountryState());
  }

  void _mapGetListCitiesEventToState(
      GetListCitiesEvent event, Emitter<LocationState> emit) async {
    _loadingData = true;
    emit(LocationInitialState());
    emit(UpdateInputSearchCitiesState());
    Map<String, dynamic> params = {
      // "countryCode": event.countryCode,
      "city": event.query
    };
    final response = await _getListCitiesUseCase.call(params);
    response.fold((l) => event.show.eitherError(l), (r) => listCity = r);
    _loadingData = false;
    emit(LocationInitialState());
    emit(UpdateInputSearchCountryState());
  }

  Future<void> getListCountriesEventToState(String query, Show show) async {
    _loadingData = true;
    add(UpdateInputSearchCountryEvent());
    Map<String, dynamic> params = {"country": query};
    final response = await _getListCountriesUsecase.call(params);
    response.fold((l) => show.eitherError(l), (r) => listCountry = r);
    _loadingData = false;
    add(UpdateInputSearchCountryEvent());
  }

  Future<void> getListCitiesEventToState(
      String? countryCode, String query, Show show) async {
    _loadingData = true;
    add(UpdateInputSearchCityEvent());
    Map<String, dynamic> params = {"countryCode": countryCode, "city": query};
    final response = await _getListCitiesUseCase.call(params);
    response.fold((l) => show.eitherError(l), (r) => listCity = r);
    _loadingData = false;
    add(UpdateInputSearchCityEvent());
  }
}
