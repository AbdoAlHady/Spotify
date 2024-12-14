import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

class NewSongsListView extends StatelessWidget {
  const NewSongsListView({
    super.key,
    required this.songs,
  });
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.songPlayerScreen,arguments: songs[index]);
          },
          child: SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 185.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(songs[index].image.toString()),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        transform: Matrix4.translationValues(10, 10, 0),
                        width: 30.h,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? AppColors.darkGrey
                              : AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: context.isDarkMode
                              ? AppColors.gery
                              : AppColors.darkGrey,
                        ),
                      ),
                    )),
                verticalSpace(13),
                // Title
                Text(
                  songs[index].title ?? "",
                  style: TextStyles.font16WhiteBold.apply(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                verticalSpace(5),
                Text(
                  songs[index].artist ?? "",
                  style: TextStyles.font14WhiteRegular.apply(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => horizontalSpace(14),
      itemCount: songs.length,
    );
  }
}
