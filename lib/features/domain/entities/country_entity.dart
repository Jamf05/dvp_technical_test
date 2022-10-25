import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? id;
  final String? pais;
  final String? nombreIngles;
  final String? codigo;
  final String? indicativo;
  final String? bandera;
  final String? banderaFirmada;
  final DateTime? updatedAt;

  const CountryEntity({
    this.id,
    this.pais,
    this.nombreIngles,
    this.codigo,
    this.indicativo,
    this.bandera,
    this.banderaFirmada,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        pais,
        nombreIngles,
        codigo,
        indicativo,
        bandera,
        banderaFirmada,
        updatedAt,
      ];

  @override
  bool get stringify => true;
}
