import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/song_entity.dart';
part 'play_list_state.freezed.dart';
@Freezed()
class PlayListState with _$PlayListState {
  const factory PlayListState.loading() = LoadingState;
  const factory PlayListState.success({required List<SongEntity>songs}) = SuccessState;
  const factory PlayListState.failure({required String message}) = FailureState;
}
