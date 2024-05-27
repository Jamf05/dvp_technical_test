import 'package:dvp_technical_test/features/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({super.id, super.ciudad, super.latitude, super.longitude});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      ciudad: json['ciudad'] ?? json['name'] ?? '',
      latitude: json['latitude'] ?? json['latitud'],
      longitude: json['longitude'] ?? json['longitud'],
    );
  }
}
