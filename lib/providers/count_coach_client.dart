import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getClientTotalProvider = FutureProvider.family<int, String>((ref, id) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('Subscriptions')
      .where('subscriber', isEqualTo: id)
      .get();
  return snapshot.docs.length;
});
final getCoachTotalProvider = FutureProvider.family<int, String>((ref, id) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('Subscriptions')
      .where('subscriber', isEqualTo: id)
      .get();
  return snapshot.docs.length;
});