import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/base_use_case.dart';
import 'package:spotify_app/features/auth/data/models/create_user_request.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';

class SignupUsecase implements BaseUseCase<Either, CreateUserRequest> {
  final AuthRepo _repo;

  SignupUsecase(this._repo);
  @override
  Future<Either> call(CreateUserRequest params) {
    return _repo.signUp(params);
  }
}
