import 'package:bloc_ecommerce/src/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../utils/constants.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
      if (googleSignIn == null) {
        // User canceled the sign-in process
        debugPrint("User canceled the signin process.");
        return null;
      }
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignIn.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      debugPrint('User: ${authResult.user?.email}');

      if(authResult.user != null){
        await createUserInDatabase(authResult.user!);
      }

      return authResult.user;
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      throw Exception(error);
    }
  }
  
  
  Future<User?> signInWithFacebook() async {
    try {
      final result = await _facebookAuth.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken!.token);
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }


  Future<User?> signInWithTwitter() async {
    try {
      final TwitterLogin twitterLogin = TwitterLogin(apiKey: TWITTER_API_KEY, apiSecretKey: TWITTER_SECRET_KEY, redirectURI: 'bloc-ecommerce://');
      final result = await twitterLogin.loginV2();

      debugPrint('Twitter login status: ${result.user?.name}');

      if(result.status == TwitterLoginStatus.loggedIn){

        final credential = TwitterAuthProvider.credential(accessToken: result.authToken!, secret: result.authTokenSecret!);

        final UserCredential authResult = await _auth.signInWithCredential(credential);

        debugPrint('Twitter login success: ${authResult.user?.displayName}');
        return authResult.user;
      } else {
        debugPrint("Twitter login failed: ${result.errorMessage}");
        return null;
      }
    } catch (e) {
      debugPrint("Twitter login failed: ${e.toString()}");
      throw Exception(e);
    }
  }

  Future<void> createUserInDatabase(User user) async {
    final data = UserModel(
      userName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber
    );
    await _firestore.collection('users').doc(user.uid).set(data.toJson()).then((value) {
      debugPrint('User Inserted, document ${user.uid}');
    });
  }
}