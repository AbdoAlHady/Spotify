import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify_app/features/auth/dmoain/entities/user_entity.dart';
part 'signup_state.freezed.dart';
@Freezed()
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = LoadingState; 
  const factory SignupState.success({required UserEntity user}) = SuccessState;
  const factory SignupState.failure({required String message}) = FailureState;
}
