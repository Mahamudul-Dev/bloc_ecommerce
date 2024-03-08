import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  bool checkLoginStatus(){
    final user = _auth.currentUser;
    if(user != null){
      return true;
    } else {
      return false;
    }
  }
}