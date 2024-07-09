import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/core/usecase/base_use_case.dart';
import 'package:spotify_app/features/home/domain/repos/home_repo.dart';

class AddOrRemoveFavotriteSongUseCase extends BaseUseCase<Either, String> {
  final HomeRepo _repo;

  AddOrRemoveFavotriteSongUseCase({required HomeRepo repo}) : _repo = repo;
  @override
  Future<Either<Failure, bool>> call({String? params}) async {
    return await _repo.addOrRemoveFavoriteSongs(songId: params!);
  }
}
