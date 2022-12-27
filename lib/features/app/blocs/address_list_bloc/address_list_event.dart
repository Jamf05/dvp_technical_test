part of 'address_list_bloc.dart';

abstract class AddressListEvent extends Equatable {
  const AddressListEvent();
  @override
  List<Object> get props => [];
}

class AddressListUpdatePageEvent extends AddressListEvent {
  const AddressListUpdatePageEvent();
}

class AddressListOnSelectingEvent extends AddressListEvent {
  final HomeBloc homeBloc;
  final AppLocalizations l10n;
  final CustomOverlay overlay;
  final AddressEntity address;
  const AddressListOnSelectingEvent({
    required this.address,
    required this.l10n,
    required this.overlay,
    required this.homeBloc
  });
}

class AddressListOnRemoveEvent extends AddressListEvent {
  final HomeBloc homeBloc;
  final AppLocalizations l10n;
  final CustomOverlay overlay;
  final AddressEntity address;
  const AddressListOnRemoveEvent({
    required this.address,
    required this.l10n,
    required this.overlay,
    required this.homeBloc
  });
}

class AddressListUpdateButtonEvent extends AddressListEvent {
  const AddressListUpdateButtonEvent();
}