import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AppTextFormTheme {
  static final InputDecorationTheme lightTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    hintStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500, color: const Color(0xFF383838)),

    contentPadding: const EdgeInsets.all(30),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black, width: 0.4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.black, width: 0.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.primary, width: 1),
    ),
  );

  static final InputDecorationTheme darkTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    hintStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500, color: const Color(0xFFA7A7A7)),
    contentPadding: const EdgeInsets.all(30),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white, width: 0.4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white, width: 0.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.primary, width: 1),
    ),
  );
}
