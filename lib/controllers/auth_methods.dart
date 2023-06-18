// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../models/user.dart' as model;

// class Auth extends ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String> signUpUser({
//     required String firstName,
//     required String email,
//     required String password,
//     required userType,
//   }) async {
//     String res = "Some error has occurred";
//     try {
//       if (email.isNotEmpty || password.isNotEmpty) {
//         //register user
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//             email: email, password: password);
//         model.UserModel user = model.UserModel(
//           uid: cred.user!.uid,
//           firstName: firstName,
//           email: email,
//           userType: userType,
//         );
//         await _firestore.collection('Admin').doc(cred.user!.uid).set(
//               user.toJson(),
//             );
//         res = "Success";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
// }
