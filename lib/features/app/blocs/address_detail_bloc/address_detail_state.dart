part of 'address_detail_bloc.dart';

abstract class AddressDetailState extends Equatable {
  const AddressDetailState();

  @override
  List<Object> get props => [];
}

class AddressDetailInitial extends AddressDetailState {
  const AddressDetailInitial();
}

class AddressDetailUpdateButtonState extends AddressDetailState {
  const AddressDetailUpdateButtonState();
}

class AddressDetailFailureState extends AddressDetailState {
  final Failure failure;
  const AddressDetailFailureState(this.failure);
}