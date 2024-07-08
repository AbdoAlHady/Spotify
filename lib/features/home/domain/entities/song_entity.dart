import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class SongEntity {
  final String? title;
  final String? artist;
  final num? duration;
  final String? image;
  final Timestamp releasedDate;

  SongEntity({
    required this.title,
    required this.artist,
    required this.image,
    required this.duration,
    required this.releasedDate,
  });
}
