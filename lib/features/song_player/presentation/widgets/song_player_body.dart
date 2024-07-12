import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:spotify_app/features/song_player/presentation/bloc/cubit/song_player_cubit.dart';
import 'package:spotify_app/features/song_player/presentation/widgets/song_details.dart';
import 'package:spotify_app/features/song_player/presentation/widgets/song_player_progress.dart';

class SongPlayerBody extends StatelessWidget {
  const SongPlayerBody({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SongPlayerCubit()..loadSong(song.songUrl!),
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Song Cover,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      song.image!,
                      height: 370.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  verticalSpace(17),
          
                  // Song Details
                  SongDetails(song: song),
                  verticalSpace(50),
          
                  // Song Progress,
                  const SongPlayerProgress()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
