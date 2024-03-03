import 'package:equatable/equatable.dart';

class BooksEntity extends Equatable {
  final String? uid;
  final String? tittle;
  final String? img_src;
  final String? description;
  final String? author;
  final List<String?> places;

  const BooksEntity({
    required this.uid,
    required this.tittle,
    required this.img_src,
    required this.description,
    required this.author,
    required this.places,
  });

  List<Object?> get props =>
      [uid, tittle, img_src, description, author, places];
}