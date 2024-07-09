import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/core/usecase/base_use_case.dart';
import 'package:spotify_app/features/home/domain/repos/home_repo.dart';

class  IsFavoriteSongUseCase extends BaseUseCase <Either,String> {
  final HomeRepo _repo;

  IsFavoriteSongUseCase(this._repo);
  @override
  Future<Either<Failure,bool>> call({String ?params}) async{
    return await _repo.isFavoriteSongs(songId: params!);
  }
  
}