part of 'address_detail_bloc.dart';

abstract class AddressDetailEvent extends Equatable {
  const AddressDetailEvent();

  @override
  List<Object> get props => [];
}

class AddressDetailUpdateButtonEvent extends AddressDetailEvent {
  const AddressDetailUpdateButtonEvent();
}

class SaveAddressEvent extends AddressDetailEvent {
  final AddressListBloc addressListBloc;
  final HomeBloc homeBloc;
  final SimpleRouter router;
  final CustomOverlay overlay;
  final AppLocalizations l10n;
  const SaveAddressEvent(
      {required this.homeBloc,
      required this.addressListBloc,
      required this.router,
      required this.overlay,
      required this.l10n});
}

class SetAddressEvent extends AddressDetailEvent {
  final AddressListBloc addressListBloc;
  final HomeBloc homeBloc;
  final SimpleRouter router;
  final CustomOverlay overlay;
  final AppLocalizations l10n;
  const SetAddressEvent(
      {required this.homeBloc,
      required this.addressListBloc,
      required this.router,
      required this.overlay,
      required this.l10n});
}

class AddressDetailFailureEvent extends AddressDetailEvent {
  final CustomOverlay overlay;
  const AddressDetailFailureEvent(this.overlay);
}
