import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_button_state.freezed.dart';
@Freezed()
class FavoriteButtonState with _$FavoriteButtonState {
  const factory FavoriteButtonState.initial() = InitialState;
  const factory FavoriteButtonState.success({required bool isFavorite}) = SuccessState;
}
