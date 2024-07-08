import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/features/auth/dmoain/entities/user_entity.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../repos/auth_repo.dart';

class SigninUsecase extends BaseUseCase<Either, SigninParams> {
  final AuthRepo _repo;

  SigninUsecase(AuthRepo repo) : _repo = repo;

  @override
  Future<Either<Failure, UserEntity>> call(SigninParams params) {
    return _repo.signIn(email: params.email, password: params.password);
  }
}

class SigninParams {
  final String email;
  final String password;

  SigninParams({required this.email, required this.password});
}
