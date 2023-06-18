import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

final coachProvider = FutureProvider<List<UserModel>>((ref) async {
  // String res = "Some error has occurred";
  // final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> doc = await firestore
      .collection('Users')
      .get();

  List<UserModel> userModels = doc.docs.map((snapshot) {
    Map<String, dynamic> data = snapshot.data();
    return UserModel(
      firstName: data['firstName'],
      uid: data['uid'],
      location: data['location'],
      dateOfBirth: data['dateOfBirth'],
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      userType: data['userType'],
      photoUrl: data['photoUrl'],
    );
  }).toList();

  return userModels;
});
