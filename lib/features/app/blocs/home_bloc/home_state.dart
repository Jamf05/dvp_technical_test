part of 'home_bloc.dart';
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeServicesFetchedState extends HomeState {
  const HomeServicesFetchedState();
  @override
  List<Object> get props => [];

}

class HomeServicesErrorState extends HomeState {
  final String error;
  const HomeServicesErrorState({required this.error});
  @override
  List<Object> get props => [error];

}
