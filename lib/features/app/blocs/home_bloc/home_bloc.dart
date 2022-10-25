import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_user_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/features/domain/usecases/log_out_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserDataUseCase _userUseCase;
  final LogOutUseCase _logOutUseCase;

  HomeBloc(
      {required GetUserDataUseCase userUseCase, required LogOutUseCase logOutUseCase})
      : _userUseCase = userUseCase,
        _logOutUseCase = logOutUseCase,
        super(HomeInitial()) {
    on<LogOutEvent>(_mapLogOutEventToState);
  }
  
  Stream<HomeState> _mapLogOutEventToState(LogOutEvent event, Emitter<HomeState> emit) async* {
    final response = await _logOutUseCase(NoParams());
    response.fold(
      (l) => event.show.eitherError(l),
      (r) => event.nav.offAllNamed("LoginWithPassWordPage.route"),
    );
  }
}
