import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

abstract class HomeRepo {
  
  Future<Either<Failure,List<SongEntity>>> getNewSongs();
  Future<Either<Failure,List<SongEntity>>> getPlayList();
}
