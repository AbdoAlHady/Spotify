import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel(
      {required super.title,
      required super.artist,
      required super.duration,
      required super.releasedDate,
      required super.image,
      required super.songUrl,
      super.isFavorite,
      super.songId});

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        title: json['title'],
        artist: json['artist'],
        duration: json['duration'],
        releasedDate: json['releasedDate'],
        image: json['image'],
        songUrl: json['songUrl'],
      );
}
