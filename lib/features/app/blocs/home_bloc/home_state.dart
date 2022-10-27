part of 'home_bloc.dart';
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
  @override
  List<Object> get props => [];
}

class UpdateButtonState extends HomeState {
  const UpdateButtonState();
  @override
  List<Object> get props => [];
}

class HomeFailureState extends HomeState {
  final Failure failure;
  const HomeFailureState(this.failure);
  @override
  List<Object> get props => [failure];
}

class SetUserDataState extends HomeState {
  const SetUserDataState();
  @override
  List<Object?> get props => [];
}

class GetUserDataState extends HomeState {
  const GetUserDataState();
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
  @override
  List<Object?> get props => [];
}