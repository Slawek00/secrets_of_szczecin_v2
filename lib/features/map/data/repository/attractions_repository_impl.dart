import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:secrets_of_szczecin_v2/features/map/data/models/attractions_model.dart';
import 'package:secrets_of_szczecin_v2/features/map/domian/repository/attractions_repository.dart';


class AttractionsRepositoryImplementation implements AttractionsRepository {
  final docRef = FirebaseFirestore.instance.collection(' attractions').withConverter(
      fromFirestore: AttractionsModel.fromFirestore,
      toFirestore: (AttractionsModel attractions, _) =>
          attractions.toFirestore());

  @override
  Future<void> getAttractions() async {
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
