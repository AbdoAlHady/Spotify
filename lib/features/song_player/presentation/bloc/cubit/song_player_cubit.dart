import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/features/song_player/presentation/bloc/cubit/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  SongPlayerCubit() : super(const SongPlayerState.loading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duartion) {
      songDuration = duartion!;
      updateSongPlayer();
    });
  }

  void updateSongPlayer() {
    emit(const SongPlayerState.success());
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(const SongPlayerState.success());
    } catch (e) {
      emit(const SongPlayerState.failure(message: AppStrings.errorMessage));
    }
  }

  Future<void> playOrPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.stop();
    } else {
      await audioPlayer.play();
    }
    emit(const SongPlayerState.success());
  }
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
