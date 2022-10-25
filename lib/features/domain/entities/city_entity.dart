import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int? id;
  final String? ciudad;
  final String? latitude;
  final String? longitude;

  const CityEntity({this.id, this.ciudad, this.latitude, this.longitude});

  @override
  List<Object?> get props => [id, ciudad, latitude, longitude];

  @override
  bool get stringify => true;
}
