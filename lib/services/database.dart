import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_android/app/catering.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  String exposedUid;

  // collection reference
  final CollectionReference cateringCollection =
      FirebaseFirestore.instance.collection('caterings');

// this method is called by AuthService class,when user first registers into firebase authentication
  Future<void> updateUserData(String name, String meal) async {
    exposedUid = uid;

    return await cateringCollection.doc(uid).set({
      'name': name,
      'meal': meal,
    });
  }

  // brew list from snapshot
  List<Catering> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Catering(
          name: doc.data()['name'] ?? '', meal: doc.data()['meal'] ?? '0');
    }).toList();
  }

  // get brews stream
  Stream<List<Catering>> get caterings {
    return cateringCollection.snapshots().map(_brewListFromSnapshot);
  }

  // // user data from snapshots
  // Brew _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return Brew(
  //       //    uid: uid,
  //       name: snapshot.data()['name'],
  //       strength: snapshot.data()['strength'],
  //       sugars: snapshot.data()['sugars']);
  // }

  // get user doc stream
  Stream<DocumentSnapshot> userData(uid) {
    return cateringCollection.doc(uid).snapshots();
  }
}
