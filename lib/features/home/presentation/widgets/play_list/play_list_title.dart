
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/utils/app_strings.dart';

class PlayListTitle extends StatelessWidget {
  const PlayListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.playList,
            style: TextStyles.font20bold,
          ),
          Text(
            AppStrings.seeMore ,
            style: TextStyles.font12WhiteRegular.apply(
                color: context.isDarkMode ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}