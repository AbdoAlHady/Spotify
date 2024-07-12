import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/common/bloc/favorite_button/cubit/favorite_button_state.dart';
import 'package:spotify_app/features/home/domain/usecases/add_or_remove_favotrite_song_use_case.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  final AddOrRemoveFavotriteSongUseCase _useCase;
  FavoriteButtonCubit(this._useCase)
      : super(const FavoriteButtonState.initial());

  void favoriteButtonUpdated({required String songId}) async {
    final result = await _useCase.call(params: songId);
    result.fold(
      (l) {},
      (isFavorite) => emit(FavoriteButtonState.success(isFavorite: isFavorite)),
    );
  }
}
