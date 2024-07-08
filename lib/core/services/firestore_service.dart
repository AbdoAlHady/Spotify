import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:spotify_app/core/error/platform_exceptions.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/utils/firebase_constants.dart';
import '../error/firebase_exceptions.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save User Data to Firestore
  Future<void> saveUserData(
      {required String userId,
      required String email,
      required String fullName}) async {
    try {
      await _db.collection(FirebaseConstants.users).doc(userId).set({
        'email': email,
        'userId': userId,
        'fullName': fullName,
      });
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw AppStrings.errorMessage;
    }
  }

  // Get New Songs
  Future<QuerySnapshot> getNewsSongsFromFirestore() async {
   try {
     final data = await _db
        .collection(FirebaseConstants.songs)
        .orderBy('releasedDate', descending: true)
        .limit(3)
        .get();
    return data;
   } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw AppStrings.errorMessage;
    }
  }

   // Get Play List
  Future<QuerySnapshot> getPlayList() async {
   try {
     final data = await _db
        .collection(FirebaseConstants.songs)
        .orderBy('releasedDate', descending: true)
        .get();
    return data;
   } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw AppStrings.errorMessage;
    }
  }
}
