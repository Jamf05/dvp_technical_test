import 'package:equatable/equatable.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? img;
  final String? name;
  final String? surname;
  final String? email;
  final String? address;
  final String? token;
  final String? phoneNumber;
  final SessionStatus? status;
  final bool? confirmed;
  final bool? hasAccess;
  final DateTime? birthDay;

  const UserEntity({
      this.id,
      this.img,
      this.name,
      this.surname,
      this.email,
      this.address,
      this.token,
      this.phoneNumber,
      this.status,
      this.confirmed,
      this.hasAccess,
      this.birthDay});

  UserEntity copyWith({
    String? id,
    String? img,
    String? name,
    String? surname,
    String? email,
    String? address,
    String? token,
    String? phoneNumber,
    SessionStatus? status,
    bool? confirmed,
    bool? hasAccess,
    DateTime? birthDay,
  }) {
    return UserEntity(
        id: id ?? this.id,
        img: img ?? this.img,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        address: address ?? this.address,
        token: token ?? this.token,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
        confirmed: confirmed ?? this.confirmed,
        hasAccess: hasAccess ?? this.hasAccess,
        birthDay: birthDay ?? this.birthDay);
  }

  @override
  List<Object?> get props => [
    id,
    img,
    name,
    surname,
    email,
    address,
    token,
    phoneNumber,
    status,
    confirmed,
    hasAccess,
    birthDay,
  ];
}
