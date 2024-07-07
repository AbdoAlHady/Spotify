import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/services/firbase_auth_service.dart';
import 'package:spotify_app/core/services/firestore_service.dart';
import 'package:spotify_app/features/auth/data/models/create_user_request.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/dmoain/entities/user_entity.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';

import '../../../../core/error/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _authService;
  final FireStoreService _storeService;

  AuthRepoImpl(this._authService, this._storeService);
  @override
  Future<Either<Failure, UserEntity>> signIn({required String email, required String password}) async{
    try {
      final result = await _authService.signInWithEmailAndPassword(email:email, password: password);
      return Right(UserModel.fromFirebaseUser(result));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      CreateUserRequest createUserReq) async {
    try {
      final result = await _authService.signUpWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      // Save User Data to Firestore
      await _storeService.saveUserData(email: createUserReq.email , userId: result.uid, fullName: createUserReq.fullName);
      debugPrint('======user name = ${result.displayName}');
      return Right(UserModel.fromFirebaseUser(result));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
