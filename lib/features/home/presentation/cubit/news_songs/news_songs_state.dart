import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/song_entity.dart';
part 'news_songs_state.freezed.dart';
@Freezed()
class NewsSongsState with _$NewsSongsState {
  const factory NewsSongsState.loading() = LoadingState;
  const factory NewsSongsState.success({required List<SongEntity>songs}) = SuccessState;
  const factory NewsSongsState.failure({required String message}) = FailureState;
}
