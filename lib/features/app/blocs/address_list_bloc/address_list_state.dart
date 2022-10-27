part of 'address_list_bloc.dart';

abstract class AddressListState extends Equatable {
  const AddressListState();
  
  @override
  List<Object> get props => [];
}

class AddressListInitial extends AddressListState {
  const AddressListInitial();
}

class AddressListUpdatePageState extends AddressListState {
  const AddressListUpdatePageState();
}

class AddressListUpdateButtonState extends AddressListState {
  const AddressListUpdateButtonState();
}

class AddressListFailureState extends AddressListState {
  final Failure failure;
  const AddressListFailureState(this.failure);
  @override
  List<Object> get props => [failure];
}