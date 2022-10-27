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
  final AppLocalizations l10n;
  final Show show;
  final AddressEntity address;
  const AddressListOnSelectingEvent(this.address, this.l10n, this.show);
}

class AddressListOnRemoveEvent extends AddressListEvent {
  final AppLocalizations l10n;
  final Show show;
  final AddressEntity address;
  const AddressListOnRemoveEvent(this.address, this.l10n, this.show);
}

class AddressListUpdateButtonEvent extends AddressListEvent {
  const AddressListUpdateButtonEvent();
}