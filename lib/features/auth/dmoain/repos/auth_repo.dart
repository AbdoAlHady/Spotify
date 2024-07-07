import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/features/auth/data/models/create_user_request.dart';

import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp(CreateUserRequest createUserReq);
  Future<UserEntity> signIn();
}
