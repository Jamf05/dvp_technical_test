part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeServicesFetchedEvent extends HomeEvent {}

class LogOutEvent extends HomeEvent {
  final Nav nav;
  final Show show;
  const LogOutEvent(this.nav, this.show);
}
