import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Container(
              width: 40.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:context.isDarkMode?Colors.white.withOpacity(0.03):Colors.black.withOpacity(0.04),
              ),
            
              child:  Icon(Icons.arrow_back_ios_new, color:context.isDarkMode?Colors.white:Colors.black, size: 15,),
            ),
          ),
    );
  }
}