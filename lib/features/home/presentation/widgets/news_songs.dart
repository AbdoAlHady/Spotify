import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:spotify_app/features/home/presentation/cubit/cubit/news_songs_cubit.dart';
import 'package:spotify_app/features/home/presentation/cubit/cubit/news_songs_state.dart';

import '../../../../core/configs/theme/text_styles.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit(getIt())..getNewsSongs(),
      child: SizedBox(
        height: 200.h,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            return state.when(
                loading: () => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()),
                success: (songs) {
                  return NewSongsListView(
                    songs: songs,
                  );
                },
                failure: Text.new);
          },
        ),
      ),
    );
  }
}

class NewSongsListView extends StatelessWidget {
  const NewSongsListView({
    super.key,
    required this.songs,
  });
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 185.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(songs[index].image.toString()),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  
                  child: Container(
                    transform: Matrix4.translationValues(10, 10, 0),
                    width: 30.h,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color:context.isDarkMode?  AppColors.darkGrey:AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:  Icon(
                      Icons.play_arrow,
                      color:context.isDarkMode? AppColors.gery:AppColors.darkGrey,
                    ),
                  ),
                )
                
              ),
              verticalSpace(13),
              // Title
              Text(
                songs[index].title ?? "",
                style: TextStyles.font16WhiteBold.apply(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              verticalSpace(5),
              Text(
                songs[index].artist ?? "",
                style: TextStyles.font14WhiteRegular.apply(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => horizontalSpace(14),
      itemCount: songs.length,
    );
  }
}
