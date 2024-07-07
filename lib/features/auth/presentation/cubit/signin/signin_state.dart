import 'package:freezed_annotation/freezed_annotation.dart';
part 'signin_state.freezed.dart';
@Freezed()
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = LoadingState;
  const factory SigninState.failure({required String message}) = FailureState;
  const factory SigninState.success() = SuccessState;
}
