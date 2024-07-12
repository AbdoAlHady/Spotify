import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/common/widgets/favorite_button.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/routing/routes.dart';
import '../../../domain/entities/song_entity.dart';

class PlayListSongsListView extends StatelessWidget {
  const PlayListSongsListView({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: ListTile(
            onTap: () {
              context.pushNamed(Routes.songPlayerScreen,arguments: songs[index]);
            },
            leading: Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : AppColors.lightGrey),
              child: Icon(
                Icons.play_arrow,
                color: context.isDarkMode ? AppColors.gery : AppColors.darkGrey,
              ),
            ),
            title: Text(songs[index].title ?? ''),
            titleTextStyle: TextStyles.font16WhiteBold.apply(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
            subtitle: Text(songs[index].artist ?? ''),
            subtitleTextStyle: TextStyles.font12WhiteRegular.apply(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(songs[index].duration.toString(),
                  style: TextStyles.font15GreyRegular),
              horizontalSpace(40),
              FavoriteButton(song: songs[index],),
            ]),
          ),
        );
      },
    );
  }
}
