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
  final Nav nav;
  final Show show;
  final AppLocalizations l10n;
  const SaveAddressEvent(this.nav, this.show, this.l10n);
}

class SetAddressEvent extends AddressDetailEvent {
  final Nav nav;
  final Show show;
  final AppLocalizations l10n;
  const SetAddressEvent(this.nav, this.show, this.l10n);
}



class AddressDetailFailureEvent extends AddressDetailEvent {
  final Show show;
  const AddressDetailFailureEvent(this.show);
}

