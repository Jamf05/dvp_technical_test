import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? surname;
  @HiveField(3)
  final AddressEntity? address;
  @HiveField(4)
  final DateTime? birthday;
  final SessionStatus status = SessionStatus.inactive;

  const UserEntity(
      {this.id, this.name, this.surname, this.address, this.birthday});

  UserEntity copyWith({
    int? id,
    String? name,
    String? surname,
    AddressEntity? address,
    DateTime? birthday,
  }) {
    return UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        address: address ?? this.address,
        birthday: birthday ?? this.birthday);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        address,
        birthday,
      ];
}
