import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'address_entity.g.dart';

@HiveType(typeId: 2)
class AddressEntity extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final bool? selected;
  @HiveField(2)
  final String? name;
  const AddressEntity({this.id, this.selected = false, this.name = ""});

  AddressEntity copyWith({
    int? id,
    bool? selected,
    String? name,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      selected: selected ?? this.selected,
      name: name ?? this.name,
    );
  }
  
  @override
  List<Object?> get props => [
        id,
        selected,
        name,
      ];
}
