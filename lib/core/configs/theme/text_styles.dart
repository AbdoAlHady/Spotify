import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class TextStyles {
  static TextStyle font18WhiteBold = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.sp);
  static TextStyle font13GreyRegular = TextStyle(
      color: AppColors.gery, fontSize: 13.sp, fontWeight: FontWeight.w400);
  static TextStyle font22WhiteBold = TextStyle(
      color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold);
  static TextStyle font17WhiteMeduim = TextStyle(
      color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w500);
}
