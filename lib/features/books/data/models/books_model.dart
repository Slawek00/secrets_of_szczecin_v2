import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domian/entities/books_entity.dart';

class BooksModel extends BooksEntity {
  const BooksModel({
    String? uid,
    String? tittle,
    String? img_src,
    String? description,
    String? author,
    required List<String?> places,
  }) : super(
          uid: uid,
          tittle: tittle,
          img_src: img_src,
          description: description,
          author: author,
          places: places,
        );

  factory BooksModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BooksModel(
      uid: data?['uid'],
      tittle: data?['tittle'],
      img_src: data?['img_src'],
      description: data?['description'],
      author: data?['author'],
      places: data?['places'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if(uid != null) "uid": uid,
      if(tittle != null) "tittle": tittle,
      if(img_src != null) "img_src": img_src,
      if(description != null) "description": description,
      if(author != null) "latitude": author,
      if(places.isNotEmpty) "longitude": places,
    };
  }
}