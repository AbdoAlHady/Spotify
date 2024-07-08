import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/core/usecase/base_use_case.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:spotify_app/features/home/domain/repos/home_repo.dart';

class GetNewsSongsUseCase extends BaseUseCase<Either,dynamic> {
  final HomeRepo _repo;

  GetNewsSongsUseCase(this._repo);
  
  @override
  Future<Either<Failure, List<SongEntity>>> call({params}) async{
    return await _repo.getNewSongs();
    
  }


} 

class NoParams{}