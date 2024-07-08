import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/domain/usecases/get_news_songs_use_case.dart';
import 'package:spotify_app/features/home/presentation/cubit/cubit/news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  final GetNewsSongsUseCase _useCase;
  NewsSongsCubit(this._useCase) : super(const NewsSongsState.loading());

  void getNewsSongs() async {
    emit(const NewsSongsState.loading());
    final result = await _useCase.call();
    result.fold(
      (failure) => emit(NewsSongsState.failure(message: failure.message)),
      (songs) => emit(NewsSongsState.success(songs: songs)),
    );
  }
}
