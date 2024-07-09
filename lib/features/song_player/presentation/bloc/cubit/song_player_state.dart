

import 'package:freezed_annotation/freezed_annotation.dart';
part 'song_player_state.freezed.dart';
@Freezed()
class SongPlayerState with _$SongPlayerState {
  const factory SongPlayerState.loading() = LoadingState;
  const factory SongPlayerState.success() = SuccessState;
  const factory SongPlayerState.failure({required String message}) =  FailureState;
}
