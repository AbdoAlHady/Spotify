import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/services/cache_helper.dart';
import 'package:spotify_app/core/utils/shared_preferences_keys.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signin/signin_state.dart';

import '../../../dmoain/repos/auth_repo.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo _repo;
  SigninCubit(this._repo) : super(const SigninState.initial());

  // Sign In
  Future<void> signIn({required String email, required String password}) async {
    emit(const SigninState.loading());
    final result = await _repo.signIn(email: email, password: password);
    result
        .fold((failure) => emit(SigninState.failure(message: failure.message)),
            (user) async {
      await CacheHelper()
          .saveData(key: SharedPreferencesKeys.userId, value: user.userId);
      emit(const SigninState.success());
    });
  }
}
