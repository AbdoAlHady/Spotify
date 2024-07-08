import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/widgets/shimmer_effect.dart';

class NewsSongsLoadingList extends StatelessWidget {
  const NewsSongsLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 160.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 160.w, height: 185.h, borderRaduis: 30),
              verticalSpace(13),
              ShimmerEffect(width: 100.w, height: 15.h, borderRaduis: 10),
              verticalSpace(5),
              ShimmerEffect(width: 60.w, height: 13.h, borderRaduis: 10),

            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          horizontalSpace(14),
      itemCount: 4,
    );
  }
}
