import 'package:firebase_auth/firebase_auth.dart';
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

  // Add or Remove Favorite Songs
  Future<bool> addOrRemoveFavoriteSongs(String songId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      var user = auth.currentUser;
      String userId = user!.uid;
      late bool isFavourite;
      QuerySnapshot favourites = await _db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.favourites)
          .where('songId', isEqualTo: songId)
          .get();
      if (favourites.docs.isNotEmpty) {
        favourites.docs.first.reference.delete();
        isFavourite = false;
      } else {
        await _db
            .collection(FirebaseConstants.users)
            .doc(userId)
            .collection(FirebaseConstants.favourites)
            .add(
          {'songId': songId, 'addedDate': Timestamp.now()},
          
        );
        isFavourite = true;
      }
      return isFavourite;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw AppStrings.errorMessage;
    }
  }

  // Check if the song is favorite
  Future<bool> isFavoriteSongs(String songId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      var user = auth.currentUser;
      String userId = user!.uid;
      QuerySnapshot favourites = await _db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.favourites)
          .where('songId', isEqualTo: songId)
          .get();
      return favourites.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw AppStrings.errorMessage;
    }
  }
}
