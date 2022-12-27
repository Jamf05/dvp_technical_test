part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class UpdateButtonEvent extends HomeEvent {}

class SetUserDataEvent extends HomeEvent {
  final CustomOverlay overlay;
  final AppLocalizations l10n;
  const SetUserDataEvent(this.overlay, this.l10n);
}

class GetUserDataEvent extends HomeEvent {
  const GetUserDataEvent();
}

class HomeLoadingEvent extends HomeEvent {
  const HomeLoadingEvent();
}
