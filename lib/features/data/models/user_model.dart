import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {int? id,
      String? name,
      String? surname,
      AddressModel? address,
      DateTime? birthday})
      : super(
            id: id,
            name: name,
            surname: surname,
            address: address,
            birthday: birthday);

  factory UserModel.cast(UserEntity? e) {
    return UserModel(
      id: e?.id,
      name: e?.name,
      surname: e?.surname,
      address: AddressModel.cast(e?.address),
      birthday: e?.birthday,
    );
  }

  UserModel copyWithModel(
      {int? id,
      String? name,
      String? surname,
      AddressModel? address,
      DateTime? birthday}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      address: address ?? AddressModel.cast(this.address),
      birthday: birthday ?? this.birthday,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: int.tryParse(json["id"].toString()),
        name: json["name"],
        surname: json["surname"],
        birthday: DateTime.tryParse(json["birth_day"].toString()),
        address: AddressModel.fromJson(json["address"])
      );

  factory UserModel.fromQuery(Map<String, dynamic> query) {
    return UserModel(
        id: int.tryParse(query["id"].toString()),
        name: query["name"],
        surname: query["name"],
        birthday: DateTime.tryParse(query["surname"]),
        address: AddressModel.fromJson(query["address"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "birthday": birthday.toString(),
      };
}
