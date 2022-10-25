import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {String? id,
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
      DateTime? birthDay})
      : super(
            id: id,
            name: name,
            surname: surname,
            email: email,
            address: address,
            token: token,
            phoneNumber: phoneNumber,
            status: status,
            confirmed: confirmed,
            hasAccess: hasAccess,
            birthDay: birthDay);

  factory UserModel.cast(UserEntity? e) {
    return UserModel(
      id: e?.id,
      img: e?.img,
      name: e?.name,
      surname: e?.surname,
      email: e?.email,
      address: e?.address,
      token: e?.token,
      phoneNumber: e?.phoneNumber,
      status: e?.status,
      confirmed: e?.confirmed,
      hasAccess: e?.hasAccess,
      birthDay: e?.birthDay,
    );
  }

  UserModel copyWithModel(
      {String? id,
      String? img,
      String? name,
      String? surname,
      String? email,
      String? password,
      String? address,
      String? token,
      String? phoneNumber,
      SessionStatus? status,
      bool? confirmed,
      bool? hasAccess,
      DateTime? birthDay}) {
    return UserModel(
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
      birthDay: birthDay ?? this.birthDay,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["userSub"],
        name: json["userName"] ?? json["name"],
        surname: json["surname"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        birthDay: DateTime.tryParse(json["birthDay"] ?? DateTime(1900)),
        img: json["img"],
        status: int.tryParse(json["sessionStatus"].toString()).toSessionStatus,
      );

  factory UserModel.fromQuery(Map query) {
    return UserModel(
        id: query["id_cognito"],
        name: query["user_name"],
        email: query["email"],
        birthDay: DateTime.tryParse(query["birthdate"]),
        status: int.tryParse(query["session_status"])?.toSessionStatus);
  }

  Map<String, dynamic> toJson() => {
        "userSub": id,
        "userName": name,
        "email": email,
        "birthDay": birthDay.toString(),
        "session_status": status?.value
      };
}
