import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title, this.isBackIocn = true, this.action});
  final Widget? title;
  final bool isBackIocn;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      actions: [
        action??const SizedBox.shrink()
      ],
      centerTitle: true,
      title: title ?? const Text(''),
      automaticallyImplyLeading: false,
      leading: isBackIocn
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Container(
                width: 40.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  size: 15,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
