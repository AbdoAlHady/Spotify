import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/common/widgets/shimmer_effect.dart';

class PlayListLoadingList extends StatelessWidget {
  const PlayListLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return Row(
          children: [

            ShimmerEffect(width: 40.w, height: 40.h, borderRaduis: 20),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerEffect(width: 100.w, height: 20.h, borderRaduis: 10),
                verticalSpace(5),
                ShimmerEffect(width: 70.w, height: 20.h, borderRaduis: 10),
              ],
            ),
          ],
        );
      },
      itemBuilder: (BuildContext context, int index) => verticalSpace(15),
      itemCount: 4,
    );
  }
}
