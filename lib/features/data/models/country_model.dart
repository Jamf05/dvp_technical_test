import 'package:dvp_technical_test/features/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    super.id,
    super.pais,
    super.nombreIngles,
    super.codigo,
    super.indicativo,
    super.bandera,
    super.banderaFirmada,
    dynamic updatedAt,
  }) : super(
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
