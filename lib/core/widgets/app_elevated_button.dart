import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key, required this.onPressed, required this.title, this.height, this.width});
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 80.h),
          
        ),
        child: Text(title));
  }
}
