import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

class SongPlayerBody extends StatelessWidget {
  const SongPlayerBody({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Row(
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

              const Icon,(Icons.favorite_outline,color: AppColors.darkGrey,size: 40,)
            ],
          ),
        ],
      ),
    );
  }
}
