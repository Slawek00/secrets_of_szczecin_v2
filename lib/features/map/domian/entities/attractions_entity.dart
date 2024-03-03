import 'package:equatable/equatable.dart';

class AttractionsEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? img_src;
  final String? short_descriptions;
  final String? latitude;
  final String? longitude;

  const AttractionsEntity({
    required this.uid,
    required this.name,
    required this.img_src,
    required this.short_descriptions,
    required this.latitude,
    required this.longitude,
  });

  List<Object?> get props =>
      [uid, name, img_src, short_descriptions, latitude, longitude];
}
