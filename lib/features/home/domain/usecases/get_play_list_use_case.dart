import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/core/usecase/base_use_case.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

import '../repos/home_repo.dart';

class GetPlayListUseCase extends BaseUseCase<Either, dynamic> {
  final HomeRepo _repo;

  GetPlayListUseCase(this._repo);
  
  @override
  Future<Either<Failure, List<SongEntity>>> call({params}) async{
    return await _repo.getPlayList();
  }

  
}
