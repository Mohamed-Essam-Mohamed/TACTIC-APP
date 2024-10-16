import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tactic_zone/src/data/models/app_user.dart';

class FirebaseService {
  //* collection User
  static CollectionReference<AppUser> getCollectionUsers() {
    return FirebaseFirestore.instance
        .collection(AppUser.collectionName)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, options) =>
              AppUser.fromJson(snapshot.data()!),
          toFirestore: (AppUser value, options) => value.toJson(),
        );
  }

  //* add user
  static Future<void> addUser(AppUser user) async {
    var _response = await getCollectionUsers().doc(user.id).set(user);
    return _response;
  }

  //* get user
  static Future<AppUser> getUser(String userId) async {
    var _response = await getCollectionUsers().doc(userId).get();
    return _response.data()!;
  }
}
