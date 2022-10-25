part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class UpdateInputSearchCountryEvent extends LocationEvent {}
class UpdateInputSearchCityEvent extends LocationEvent {}

class SendDataEvent extends LocationEvent {
  final Nav nav;
  SendDataEvent(this.nav);
}

class GetListCountriesEvent extends LocationEvent {
  final String query;
  final Show show;
  GetListCountriesEvent(this.query, this.show);
}

class GetListCitiesEvent extends LocationEvent {
  final String query;
  final Show show;
  GetListCitiesEvent(this.query, this.show);
}
