import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

class  SongModel extends SongEntity {
  SongModel({required super.title, required super.artist, required super.duration, required super.releasedDate});

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
    title: json['title'],
    artist: json['artist'],
    duration: json['duration'],
    releasedDate: json['releasedDate'],
  );
  
}