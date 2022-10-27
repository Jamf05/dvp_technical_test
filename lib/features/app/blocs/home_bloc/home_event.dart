part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class UpdateButtonEvent extends HomeEvent {}

class SetUserDataEvent extends HomeEvent {
  final Show show;
  final AppLocalizations l10n;
  const SetUserDataEvent(this.show, this.l10n);
}

class GetUserDataEvent extends HomeEvent {
  const GetUserDataEvent();
}

class HomeLoadingEvent extends HomeEvent {
  const HomeLoadingEvent();
}
