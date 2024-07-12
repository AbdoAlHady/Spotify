import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class SongEntity {
  final String? title;
  final String? artist;
  final num? duration;
  final String? image;
  final Timestamp releasedDate;
  final String? songUrl;
  bool? isFavorite;
  String? songId;

  SongEntity({
    required this.title,
    this.songId,
    this.isFavorite,
    required this.songUrl,
    required this.artist,
    required this.image,
    required this.duration,
    required this.releasedDate,
  });
}
