part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class CheckAuthenticatedState extends SplashState {}

class RejectUserConfirmationState extends SplashState {}

class FailureState extends SplashState {
  final Failure failure;
  const FailureState(this.failure);
}

