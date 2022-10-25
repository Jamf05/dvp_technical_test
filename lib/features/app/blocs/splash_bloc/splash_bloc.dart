import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/app/blocs/global/global_session_bloc/global_session_bloc.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';
import 'package:dvp_technical_test/features/domain/usecases/check_authenticated_use_case.dart';
import 'package:dvp_technical_test/features/domain/usecases/reject_user_confirmation_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthenticatedUseCase _checkAuthenticated;
  final RejectUserConfirmationUseCase _rejectUserConfirmation;
  
  SplashBloc({
    required CheckAuthenticatedUseCase checkAuthenticated,
    required RejectUserConfirmationUseCase rejectUserConfirmation,
  })
    : _checkAuthenticated = checkAuthenticated,
      _rejectUserConfirmation = rejectUserConfirmation,
      super(SplashInitial()) {
        on<CheckAuthenticatedEvent>(_mapCheckAuthenticatedToState);
        on<RejectUserConfirmationEvent>(_mapRejectUserConfirmationToState);
      }
  
  SessionStatus? _sessionStatus;
  SessionStatus? get sessionStatus => _sessionStatus;

  void _mapCheckAuthenticatedToState(CheckAuthenticatedEvent event, Emitter<SplashState> emit) async {
    final response = await _checkAuthenticated(NoParams());
    emit(response.fold(
      (l) => FailureState(l),
      (r) {
      _sessionStatus = r?.status;
      final gBloc = sl<GlobalSessionBloc>();
      gBloc.user = r;
      return CheckAuthenticatedState();
    }));
  }

  void _mapRejectUserConfirmationToState(RejectUserConfirmationEvent event, Emitter<SplashState> emit) async {
    final response = await _rejectUserConfirmation(NoParams());
    emit(response.fold(
      (l) => FailureState(l),
      (r) => RejectUserConfirmationState(),
    ));
  }
}
