import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/services/firbase_auth_service.dart';
import 'package:spotify_app/features/auth/data/models/create_user_request.dart';
import 'package:spotify_app/features/auth/data/models/user_model.dart';
import 'package:spotify_app/features/auth/dmoain/entities/user_entity.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';

import '../../../../core/error/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService _authService;

  AuthRepoImpl(this._authService);
  @override
  Future<UserEntity> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      CreateUserRequest createUserReq) async {
    try {
      final result = await _authService.signUpWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right(UserModel.fromFirebaseUser(result));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
