import 'package:bloc/bloc.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/core/utils/formaters.dart';
import 'package:dvp_technical_test/core/validators/text_input.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_user_data_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/register_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserDataUseCase _getUserUseCase;
  final SetUserUseCase _setUserUseCase;

  HomeBloc({
    required GetUserDataUseCase getUserUseCase,
    required SetUserUseCase setUserUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _setUserUseCase = setUserUseCase,
        super(const HomeInitial()) {
    on<UpdateButtonEvent>(_mapUpdateButtonEventToState);
    on<SetUserDataEvent>(_mapSetUserDataEventToState);
    on<GetUserDataEvent>(_mapGetUserDataEventToState);
    on<HomeLoadingEvent>(_mapHomeLoadingEventToState);
  }

  bool isLoadingPage = true;
  bool sendingData = false;
  UserEntity user = const UserEntity();

  TextFormInput _name = const TextFormInput.dirty("", start: 0, end: 15);
  TextFormInput get name => _name;
  set name(TextFormInput v) {
    _name = v;
    add(UpdateButtonEvent());
  }

  TextFormInput _surname = const TextFormInput.dirty("", start: 0, end: 15);
  TextFormInput get surname => _surname;
  set surname(TextFormInput v) {
    _surname = v;
    add(UpdateButtonEvent());
  }

  DateTime? _birthdayDate;
  DateTime? get birthdayDate => _birthdayDate;
  set birthdayDate(DateTime? v) {
    _birthdayDate = v;
    final formatted = Formatters.date(date: v);
    _birthday = TextFormInput.dirty(formatted, start: 0, end: 15);
    birthdayTextEditingCtrl.text = formatted;
    add(UpdateButtonEvent());
  }

  TextFormInput _birthday = const TextFormInput.dirty("", start: 0, end: 10);
  TextFormInput get birthday => _birthday;

  final TextEditingController birthdayTextEditingCtrl = TextEditingController();
  final TextEditingController addressTextEditingCtrl = TextEditingController();

  bool get validForm {
    final form = Formz.validate([
      _name,
      _surname,
      _birthday,
    ]);
    return form.isValid == true && user.address?.id != null;
  }

  void _mapUpdateButtonEventToState(
      UpdateButtonEvent event, Emitter<HomeState> emit) async {
    emit(const HomeInitial());
    emit(const UpdateButtonState());
  }

  void _mapHomeLoadingEventToState(
      HomeLoadingEvent event, Emitter<HomeState> emit) async {
    emit(const HomeInitial());
    emit(const HomeLoadingState());
  }

  void _mapSetUserDataEventToState(
      SetUserDataEvent event, Emitter<HomeState> emit) async {
    sendingData = true;
    add(UpdateButtonEvent());
    final newUser = user.copyWith(
      id: UniqueKey().hashCode,
      name: _name.value,
      surname: _surname.value,
      birthday: _birthdayDate,
      address: user.address
    );
    await Future.delayed(const Duration(seconds: 1));
    final response = await _setUserUseCase.call(newUser);
    response.fold((l) => emit(HomeFailureState(l)), (r) {
      user = newUser;
      event.show.successNotification(event.l10n.homePageSuccessNotification1);
    });
    sendingData = false;
    add(UpdateButtonEvent());
  }

  void _mapGetUserDataEventToState(
      GetUserDataEvent event, Emitter<HomeState> emit) async {
    isLoadingPage = true;
    add(const HomeLoadingEvent());
    await Future.delayed(const Duration(seconds: 1));
    final response = await _getUserUseCase.call(NoParams());
    response.fold((l) => emit(HomeFailureState(l)), (r) {
      user = r ?? user;
      name = name.copyWith(user.name ?? '');
      surname = surname.copyWith(user.surname ?? '');
      birthdayDate = user.birthday;
      addressTextEditingCtrl.text = user.address?.name ?? '';
    });
    isLoadingPage = false;
    add(const HomeLoadingEvent());
  }
}
