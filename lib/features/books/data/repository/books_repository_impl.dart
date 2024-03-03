import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../domian/repository/books_repository.dart';
import '../models/books_model.dart';


class BooksRepositoryImplementation implements BooksRepository{
  final docRef = FirebaseFirestore.instance.collection('books').withConverter(
      fromFirestore: BooksModel.fromFirestore,
      toFirestore: (BooksModel attractions, _) =>
          attractions.toFirestore());

  @override
  Future<void> getBooks() async {
    docRef.snapshots().listen(
    (event) {
      for (var docSnapshot in event.docs) {
        debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => debugPrint("Error completing: $e"),
  );
  }
}