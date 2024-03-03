import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domian/entities/attractions_entity.dart';


class AttractionsModel extends AttractionsEntity {
  const AttractionsModel({
    String? uid,
    String? name,
    String? img_src,
    String? short_descriptions,
    String? latitude,
    String? longitude,
  }) : super(
          uid: uid,
          name: name,
          img_src: img_src,
          short_descriptions: short_descriptions,
          latitude: latitude,
          longitude: longitude,
        );

  factory AttractionsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AttractionsModel(
      uid: data?['uid'],
      name: data?['name'],
      img_src: data?['img_src'],
      short_descriptions: data?['short_descriptions'],
      latitude: data?['latitude'],
      longitude: data?['longitude'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if(uid != null) "uid": uid,
      if(name != null) "name": name,
      if(img_src != null) "img_src": img_src,
      if(short_descriptions != null) "short_descriptions": short_descriptions,
      if(latitude != null) "latitude": latitude,
      if(longitude != null) "longitude": longitude,
    };
  }
}
