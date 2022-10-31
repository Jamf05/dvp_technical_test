import 'package:bloc/bloc.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/usecase/usecase.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_list_address_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/remove_address_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/set_address_usecase.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:equatable/equatable.dart';

part 'address_list_event.dart';
part 'address_list_state.dart';

class AddressListBloc extends Bloc<AddressListEvent, AddressListState> {
  final GetListAddressUsecase _getListAddressUsecase;
  final SetAddressUseCase _setAddressUseCase;
  final RemoveAddressUseCase _removeAddressUseCase;
  AddressListBloc({
    required GetListAddressUsecase getListAddressUsecase,
    required SetAddressUseCase setAddressUseCase,
    required RemoveAddressUseCase removeAddressUseCase,
  })  : _getListAddressUsecase = getListAddressUsecase,
        _setAddressUseCase = setAddressUseCase,
        _removeAddressUseCase = removeAddressUseCase,
        super(const AddressListInitial()) {
    on<AddressListUpdateButtonEvent>(_mapAddressListUpdateButtonEventToState);
    on<AddressListUpdatePageEvent>(_mapAddressListUpdatePageEventToState);
    on<AddressListOnSelectingEvent>(_mapAddressListOnSelectingEventToState);
    on<AddressListOnRemoveEvent>(_mapAddressListOnRemoveEventToState);
  }

  bool _loadingPage = true;
  bool get loadingPage => _loadingPage;

  bool _sendingData = false;
  bool get sendingData => _sendingData;

  List<AddressEntity> _list = [];
  List<AddressEntity> get list => _list;

  void _mapAddressListUpdateButtonEventToState(
      AddressListUpdateButtonEvent event,
      Emitter<AddressListState> emit) async {
    emit(const AddressListInitial());
    emit(const AddressListUpdateButtonState());
  }

  void _mapAddressListUpdatePageEventToState(
      AddressListUpdatePageEvent event, Emitter<AddressListState> emit) async {
    _loadingPage = true;
    emit(const AddressListInitial());
    emit(const AddressListUpdatePageState());

    await Future.delayed(const Duration(seconds: 1));
    final response = await _getListAddressUsecase.call(NoParams());
    response.fold(
        (l) => emit(AddressListFailureState(l)), (r) => _list = (r ?? []));

    _loadingPage = false;
    emit(const AddressListInitial());
    emit(const AddressListUpdatePageState());
  }

  Future<void> _mapAddressListOnSelectingEventToState(
      AddressListOnSelectingEvent event, Emitter<AddressListState> emit) async {
    _sendingData = true;
    add(const AddressListUpdateButtonEvent());
    await Future.delayed(const Duration(seconds: 1));
    final response =
        await _setAddressUseCase.call(event.address.copyWith(selected: true));
    response.fold((l) => event.show.eitherError(l), (r) {
      final homeBloc = sl<HomeBloc>();
      homeBloc.addressTextEditingCtrl.text = event.address.name ?? '';
      homeBloc.user = homeBloc.user.copyWith(address: event.address);
      homeBloc.add(UpdateButtonEvent());
      add(const AddressListUpdatePageEvent());
      event.show.successNotification(event.l10n.homePageSuccessNotification1);
    });
    _sendingData = false;
    add(const AddressListUpdateButtonEvent());
  }

  Future<void> _mapAddressListOnRemoveEventToState(
      AddressListOnRemoveEvent event, Emitter<AddressListState> emit) async {
    _sendingData = true;
    add(const AddressListUpdateButtonEvent());
    await Future.delayed(const Duration(seconds: 1));
    final response = await _removeAddressUseCase.call(event.address);
    response.fold((l) => event.show.eitherError(l), (r) {
      final homeBloc = sl<HomeBloc>();
      if (event.address.selected == true) {
        homeBloc.addressTextEditingCtrl.text = '';
        homeBloc.user = homeBloc.user.copyWith(address: const AddressEntity());
        homeBloc.add(UpdateButtonEvent());
      }
      add(const AddressListUpdatePageEvent());
      event.show.successNotification(event.l10n.homePageSuccessNotification1);
    });
    _sendingData = false;
    add(const AddressListUpdateButtonEvent());
  }
}
