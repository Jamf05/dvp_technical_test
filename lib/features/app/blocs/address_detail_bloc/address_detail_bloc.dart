import 'package:bloc/bloc.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';
import 'package:dvp_technical_test/core/validators/text_input.dart';
import 'package:dvp_technical_test/features/app/blocs/address_list_bloc/address_list_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/address_detail_page.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/usecases/save_address_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/set_address_usecase.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'address_detail_event.dart';
part 'address_detail_state.dart';

class AddressDetailBloc extends Bloc<AddressDetailEvent, AddressDetailState> {
  final SetAddressUseCase _setAddressUseCase;
  final SaveAddressUseCase _saveAddressUseCase;
  AddressDetailBloc({
    required SetAddressUseCase setAddressUseCase,
    required SaveAddressUseCase saveAddressUseCase,
  })  : _setAddressUseCase = setAddressUseCase,
        _saveAddressUseCase = saveAddressUseCase,
        super(const AddressDetailInitial()) {
    on<AddressDetailUpdateButtonEvent>(_mapUpdateButtonEventToState);
    on<SaveAddressEvent>(_mapSaveAddressEventToState);
    on<SetAddressEvent>(_mapSetAddressEventToState);
  }

  bool sendingData = false;
  AddressEntity address = const AddressEntity();
  late AddressDetailAction _action;

  TextFormInput _addressInput =
      const TextFormInput.dirty("", start: 0, end: 100);
  TextFormInput get addressInput => _addressInput;
  set addressInput(TextFormInput v) {
    _addressInput = v;
    add(const AddressDetailUpdateButtonEvent());
  }

  void _mapUpdateButtonEventToState(AddressDetailUpdateButtonEvent event,
      Emitter<AddressDetailState> emit) async {
    emit(const AddressDetailInitial());
    emit(const AddressDetailUpdateButtonState());
  }

  void _mapSaveAddressEventToState(
      SaveAddressEvent event, Emitter<AddressDetailState> emit) async {
    sendingData = true;
    add(const AddressDetailUpdateButtonEvent());
    final newAddress = AddressEntity(
        id: UniqueKey().hashCode, name: _addressInput.value, selected: true);
    await Future.delayed(const Duration(seconds: 1));
    final response = await _saveAddressUseCase.call(newAddress);
    response.fold((l) => emit(AddressDetailFailureState(l)), (r) {
      final addressListBloc = sl.get<AddressListBloc>();
      addressListBloc.add(const AddressListUpdatePageEvent());
      final homeBloc = sl.get<HomeBloc>();
      homeBloc.addressTextEditingCtrl.text = newAddress.name ?? '';
      homeBloc.user = homeBloc.user.copyWith(address: newAddress);
      event.show.successNotification(event.l10n.homePageSuccessNotification1);
      event.nav.back();
    });
    sendingData = false;
    add(const AddressDetailUpdateButtonEvent());
  }

  void _mapSetAddressEventToState(
      SetAddressEvent event, Emitter<AddressDetailState> emit) async {
    sendingData = true;
    add(const AddressDetailUpdateButtonEvent());
    final newAddress = address.copyWith(name: _addressInput.value);
    await Future.delayed(const Duration(seconds: 1));
    final response = await _setAddressUseCase.call(newAddress);
    response.fold((l) => emit(AddressDetailFailureState(l)), (r) {
      final addressListBloc = sl.get<AddressListBloc>();
      addressListBloc.add(const AddressListUpdatePageEvent());
      if(newAddress.selected == true) {
        final homeBloc = sl.get<HomeBloc>();
        homeBloc.addressTextEditingCtrl.text = newAddress.name ?? '';
        homeBloc.user = homeBloc.user.copyWith(address: newAddress);
      }
      event.show.successNotification(event.l10n.homePageSuccessNotification1);
      event.nav.back();
    });
    sendingData = false;
    add(const AddressDetailUpdateButtonEvent());
  }

  Future<void> initState({AddressEntity? address, required AddressDetailAction action}) async {
    _action = action;
    this.address = address ?? this.address;
    _addressInput = _addressInput.copyWith(this.address.name ?? '');
  }

  void runBasedOn(Nav nav, Show show, AppLocalizations l10n) async {
    switch (_action) {
      case AddressDetailAction.edit:
        add(SetAddressEvent(nav, show, l10n));
        break;
      case AddressDetailAction.create:
        add(SaveAddressEvent(nav, show, l10n));
        break;
      default:
    }
  }
}
