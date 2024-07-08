import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/configs/theme/text_styles.dart';
import '../../../../core/utils/app_strings.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: AppColors.primary,
      tabAlignment: TabAlignment.center,
      labelColor: context.isDarkMode?Colors.white:Colors.black,
      dividerHeight: 0,
      padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 16.h),
      tabs:  [
        Text(AppStrings.news,style: TextStyles.font16BlackMeduim.apply(color: context.isDarkMode?Colors.white:Colors.black)),
        Text(AppStrings.videos,style: TextStyles.font16BlackMeduim.apply(color: context.isDarkMode?Colors.white:Colors.black)),
        Text(AppStrings.artists,style: TextStyles.font16BlackMeduim.apply(color: context.isDarkMode?Colors.white:Colors.black)),
        Text(AppStrings.prodcasts,style: TextStyles.font16BlackMeduim.apply(color: context.isDarkMode?Colors.white:Colors.black)),
      ],
    );
  }
}
