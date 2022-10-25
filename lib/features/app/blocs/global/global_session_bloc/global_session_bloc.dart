import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';

part 'global_session_event.dart';
part 'global_session_state.dart';

class GlobalSessionBloc extends Bloc<GlobalSessionEvent, GlobalSessionState> {
  GlobalSessionBloc() : super(GlobalSessionBlocInitial());

  UserEntity? _user;
  UserEntity? get user => _user;
  set user(UserEntity? u) => _user = u;
  
  @override
  Stream<GlobalSessionState> mapEventToState(
    GlobalSessionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
