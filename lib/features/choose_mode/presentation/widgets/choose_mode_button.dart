import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/helpers/spacing.dart';

class ChooseModeButton extends StatelessWidget {
  const ChooseModeButton({
    super.key,
    required this.imagePath,
    required this.title, required this.onPressed,
  });
  final String imagePath;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 73.h,
                width: 73.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF30393c).withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  imagePath,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        verticalSpace(10),

        // Title
        Text(
          title,
          style: TextStyles.font17WhiteMeduim,
        ),
      ],
    );
  }
}
