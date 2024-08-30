import 'package:firebase_auth/firebase_auth.dart';
import 'package:sf221/service/database_service.dart';

import '../helper/helper_function.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //login
  Future loginUserWithEmailandPassword(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //register
  Future registerUserWithEmailandPassword(String username, String password,
      String email, String building, String room, String telephone) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await DatabaseService(uid: user.uid)
            .savingUserData(username, email, building, room, telephone);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign out
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserNameSF('');
      await HelperFunctions.saveUserEmailSF('');
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
