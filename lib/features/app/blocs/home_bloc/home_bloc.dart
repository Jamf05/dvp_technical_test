import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dvp_technical_test/core/utils/formaters.dart';
import 'package:dvp_technical_test/core/validators/text_input.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_user_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/features/domain/usecases/log_out_usecase.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserDataUseCase _userUseCase;
  final LogOutUseCase _logOutUseCase;

  TextFormInput _name = const TextFormInput.dirty("", start: 0, end: 10);
  TextFormInput get name => _name;
  set name(TextFormInput v) {
    _name = v;
    add(UpdateButtonEvent());
  }

  TextFormInput _surName = const TextFormInput.dirty("", start: 0, end: 10);
  TextFormInput get surName => _surName;
  set surName(TextFormInput v) {
    _surName = v;
    add(UpdateButtonEvent());
  }

  DateTime? _birthdayDate;
  DateTime? get birthdayDate => _birthdayDate;
  set birthdayDate(DateTime? v) {
    _birthdayDate = v;
    final formatted = Formatters.date(date: v);
    _birthday = TextFormInput.dirty(formatted, start: 0, end: 10);
    birthdayCtrl.text = formatted;
    add(UpdateButtonEvent());
  }

  TextFormInput _birthday = const TextFormInput.dirty("", start: 0, end: 10);
  TextFormInput get birthday => _birthday;

  final TextEditingController _birthdayCtrl = TextEditingController();
  TextEditingController get birthdayCtrl => _birthdayCtrl;

  bool get validForm {
    final form = Formz.validate([
      _name,
      _surName,
      _birthday,
    ]);
    return form.isValid == true;
  }

  HomeBloc(
      {required GetUserDataUseCase userUseCase,
      required LogOutUseCase logOutUseCase})
      : _userUseCase = userUseCase,
        _logOutUseCase = logOutUseCase,
        super(const HomeInitial()) {
    on<LogOutEvent>(_mapLogOutEventToState);
    on<UpdateButtonEvent>(_mapUpdateButtonEventToState);
  }

  void _mapUpdateButtonEventToState(
      UpdateButtonEvent event, Emitter<HomeState> emit) async {
    emit(const HomeInitial());
    emit(const UpdateButtonState());
  }

  Stream<HomeState> _mapLogOutEventToState(
      LogOutEvent event, Emitter<HomeState> emit) async* {
    final response = await _logOutUseCase(NoParams());
    response.fold(
      (l) => event.show.eitherError(l),
      (r) => event.nav.offAllNamed("LoginWithPassWordPage.route"),
    );
  }
}
