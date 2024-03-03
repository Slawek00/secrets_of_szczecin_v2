import 'package:equatable/equatable.dart';

class StoriesEntity extends Equatable {
  final String? uid;
  final String? name;
  final List<String?> img_src;
  final String? descriptions;


  const StoriesEntity({
    required this.uid,
    required this.name,
    required this.img_src,
    required this.descriptions,
  });

  List<Object?> get props =>
      [uid, name, img_src, descriptions];
}