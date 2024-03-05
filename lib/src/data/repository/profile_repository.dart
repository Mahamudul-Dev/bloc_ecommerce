
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Future<UserModel> fetchUserFromFirestore() async {
  //   try {
  //     final userData = await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
  //
  //     if(userData.data() != null){
  //       final user = UserModel.fromJson(userData.data()!);
  //       debugPrint('User Name: ${user.userName}');
  //       return user;
  //     }
  //   } catch (error) {
  //     debugPrint("Error signing in with Google: $error");
  //     throw Exception(error);
  //   }
  // }
}