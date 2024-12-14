import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';

import '../../../../core/configs/assets/app_images.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                fit: BoxFit.fill,
                AppVerctors.artistCard,
              ),
            ),
        
            // Artist Image,
            Padding(
              padding:  EdgeInsets.only(right: 40.w),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(AppImages.homeArtist)),
            )
          ],
        ),
      ),
    );
  }
}