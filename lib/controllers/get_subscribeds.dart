import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> getClientTotal(String id) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Subscriptions')
      .where('subscriber', isEqualTo: id)
      .get();
  // print(snapshot.docs.length);
  return snapshot.docs.length;
}

Future<int> getCoachTotal(String id) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Subscriptions')
      .where('subscriber', isEqualTo: id)
      .get();
  // print(snapshot.docs.length);
  return snapshot.docs.length;
}
