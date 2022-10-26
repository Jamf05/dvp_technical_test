import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int? id;
  final bool principal;
  final String name;
  const AddressEntity({this.id, this.principal = false, this.name = ""});
  @override
  List<Object?> get props => throw UnimplementedError();
}