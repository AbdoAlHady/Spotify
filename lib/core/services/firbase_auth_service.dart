import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:spotify_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:spotify_app/core/exceptions/firebase_exceptions.dart';
import 'package:spotify_app/core/exceptions/platform_exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up With Email and Password
  Future<User> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.toString());
    } on PlatformException catch (e) {
      throw AppPlatformException(e.toString());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString());
    }catch(e){
      throw 'An error occured , please try again later.';
    }
  }
}
