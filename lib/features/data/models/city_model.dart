import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({int? id, String? ciudad, String? latitude, String? longitude})
      : super(
          id: id,
          ciudad: ciudad,
          latitude: latitude,
          longitude: longitude,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      ciudad: json['ciudad'] ?? json['name'] ?? '',
      latitude: json['latitude'] ?? json['latitud'],
      longitude: json['longitude'] ?? json['longitud'],
    );
  }
}
