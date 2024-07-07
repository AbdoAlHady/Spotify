import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/auth/data/models/create_user_request.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  SignupCubit(this._authRepo) : super(const SignupState.initial());

  void signup(
      {required String email,
      required String password,
      required String fullName}) async {
    emit(const SignupState.loading());
    final user = await _authRepo.signUp(CreateUserRequest(
        fullName: fullName, email: email, password: password));
    user.fold(
      (failure) => emit(SignupState.failure(message: failure.message)),
      (userEntity) => emit(
        SignupState.success(user: userEntity),
      ),
    );
  }
}
