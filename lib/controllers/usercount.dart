import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getUsersCount(String userType) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('userType', isEqualTo: userType)
      .get();

  return snapshot.docs.length;
}
