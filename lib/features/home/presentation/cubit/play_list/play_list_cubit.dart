import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/domain/usecases/get_play_list_use_case.dart';

import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  final GetPlayListUseCase _useCase;
  PlayListCubit(this._useCase) : super(const PlayListState.loading());

  void getPlayList() async {
    emit(const PlayListState.loading());
    final result = await _useCase();
    result.fold(
      (failure) => emit(PlayListState.failure(message: failure.message)),
      (songs) => emit(PlayListState.success(songs: songs)),
    );
  }
}
