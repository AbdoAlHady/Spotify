import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

import '../widgets/song_player_body.dart';

class SongPlayerScreen extends StatelessWidget {
  const SongPlayerScreen({super.key, required this.song});
  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Now Playing',
          style: TextStyles.font18WhiteBold.copyWith(
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body:  SongPlayerBody(song: song,),
    );
  }
}
