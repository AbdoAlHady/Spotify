import 'package:flutter/material.dart';
import 'package:spotify_app/common/widgets/favorite_button.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

import '../../../../core/configs/theme/text_styles.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.artist!,
                style: TextStyles.font16WhiteBold.apply(
                    color: context.isDarkMode ? Colors.white : Colors.black)),
            Text(song.title!,
                style: TextStyles.font14WhiteRegular.apply(
                    color: context.isDarkMode ? Colors.white : Colors.black)),
          ],
        ),
        FavoriteButton(song: song),
      ],
    );
  }
}
