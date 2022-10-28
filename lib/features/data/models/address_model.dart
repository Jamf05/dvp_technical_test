import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    int? id,
    bool? selected = false,
    String? name = "",
  }) : super(id: id, selected: selected, name: name);

  factory AddressModel.cast(AddressEntity? e) {
    return AddressModel(
      id: e?.id,
      selected: e?.selected,
      name: e?.name,
    );
  }

  AddressModel copyWithModel({
    int? id,
    bool? selected,
    String? name,
  }) {
    return AddressModel(
      id: id ?? this.id,
      selected: selected ?? this.selected,
      name: name ?? this.name,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: int.tryParse(json["id"].toString()),
        selected: json["selected"] == true,
        name: json["name"],
      );

  factory AddressModel.fromQuery(Map<String, dynamic> query) {
    return AddressModel(
        id: int.tryParse(query["id"].toString()),
        selected: query["selected"] == 1,
        name: query["name"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "selected": selected,
        "name": name,
      };

  Map<String, dynamic> toQuery() => {
        "id": id,
        "selected": selected == true ? 1 : 0,
        "name": name,
      };
}
