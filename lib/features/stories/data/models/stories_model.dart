import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domian/entities/stories_entity.dart';

class StoriesModel extends StoriesEntity {
  const StoriesModel({
    String? uid,
    String? name,
    required List<String?> img_src,
    String? descriptions,
  }) : super(
          uid: uid,
          name: name,
          img_src: img_src,
          descriptions: descriptions,
        );

  factory StoriesModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return StoriesModel(
      uid: data?['uid'],
      name: data?['name'],
      img_src: data?['img_src'],
      descriptions: data?['descriptions'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if(uid != null) "uid": uid,
      if(name != null) "name": name,
      if(img_src.isNotEmpty) "img_src": img_src,
      if(descriptions != null) "descriptions": descriptions,
    };
  }
}