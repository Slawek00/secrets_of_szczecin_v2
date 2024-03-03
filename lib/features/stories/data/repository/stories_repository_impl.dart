import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:secrets_of_szczecin_v2/features/stories/data/models/stories_model.dart';
import 'package:secrets_of_szczecin_v2/features/stories/domian/repository/stories_repository.dart';

class StoriesRepositoryImplementation implements StoriesRepository {
  final docRef = FirebaseFirestore.instance.collection('stories').withConverter(
      fromFirestore: StoriesModel.fromFirestore,
      toFirestore: (StoriesModel stories, _) => stories.toFirestore());

  @override
  Future<void> getStories() async {
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
