import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/error/failure.dart';
import 'package:spotify_app/core/services/firestore_service.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:spotify_app/features/home/domain/repos/home_repo.dart';

import '../models/song_model.dart';

class HomeRepoImple extends HomeRepo {
  final FireStoreService _storeService;

  HomeRepoImple(this._storeService);
  @override
  Future<Either<Failure, List<SongEntity>>> getNewSongs() async {
    try {
      List<SongModel> songs = [];
      final result = await _storeService.getNewsSongsFromFirestore();

      for (var element in result.docs) {
        var songModel =
            SongModel.fromJson(element.data() as Map<String, dynamic>);
        bool isFavourite = await _storeService.isFavoriteSongs(element.id);
        songModel.isFavorite = isFavourite;
        songModel.songId = element.reference.id;
        songs.add(songModel);
      }
      debugPrint('=== Songs Length: ${songs.length} ===');
      return Right(songs);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getPlayList() async {
    try {
      List<SongModel> songs = [];
      final result = await _storeService.getPlayList();
      for (var element in result.docs) {
        var songModel =
            SongModel.fromJson(element.data() as Map<String, dynamic>);
        bool isFavourite = await _storeService.isFavoriteSongs(element.id);
        songModel.isFavorite = isFavourite;
        songModel.songId = element.reference.id;
        songs.add(songModel);
      }
      debugPrint('=== Songs Length: ${songs.length} ===');
      return Right(songs);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addOrRemoveFavoriteSongs(
      {required String songId}) async {
    try {
      final result = await _storeService.addOrRemoveFavoriteSongs(songId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavoriteSongs(
      {required String songId}) async {
    try {
      final result = await _storeService.isFavoriteSongs(songId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
