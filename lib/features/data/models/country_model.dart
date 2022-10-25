import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    String? id,
    String? pais,
    String? nombreIngles,
    String? codigo,
    String? indicativo,
    String? bandera,
    String? banderaFirmada,
    dynamic updatedAt,
  }) : super(
          id: id,
          pais: pais,
          nombreIngles: nombreIngles,
          codigo: codigo,
          indicativo: indicativo,
          bandera: bandera,
          banderaFirmada: banderaFirmada,
          updatedAt: updatedAt,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['isoCode'],
      pais: json['name'] ?? json['name'] ?? '',
      nombreIngles: json['nombre_ingles'],
      codigo: json['code'],
      indicativo: json['phoneCode']?.toString(),
      bandera: json['bandera'],
      banderaFirmada: json['bandera_firmada'],
      updatedAt: json['updated_at'],
    );
  }
}
