import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_app/core/exceptions/firebase_auth_exceptions.dart';
import 'package:spotify_app/core/exceptions/firebase_exceptions.dart';
import 'package:spotify_app/core/exceptions/platform_exceptions.dart';
import 'package:spotify_app/core/utils/app_strings.dart';

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
      debugPrint('==========error = ${e.toString()}');
      throw AppFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    }
    catch(e){
      throw AppStrings.errorMessage;
    }
  }

  // Sign in With Email and Password
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    }
    catch(e){
      throw AppStrings.errorMessage;
    }
  }
}
