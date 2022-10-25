part of 'global_session_bloc.dart';

abstract class GlobalSessionState extends Equatable {
  const GlobalSessionState();
  
  @override
  List<Object> get props => [];
}

class GlobalSessionBlocInitial extends GlobalSessionState {}
