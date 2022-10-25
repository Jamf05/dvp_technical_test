part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitialState extends LocationState {}

class UpdateInputSearchCountryState extends LocationState {}

class UpdateInputSearchCitiesState extends LocationState {}
