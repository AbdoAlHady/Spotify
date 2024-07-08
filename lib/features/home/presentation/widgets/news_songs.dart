import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/features/home/presentation/cubit/cubit/news_songs_cubit.dart';
import 'package:spotify_app/features/home/presentation/cubit/cubit/news_songs_state.dart';
import 'package:spotify_app/features/home/presentation/widgets/news_songs_list_view.dart';
import 'package:spotify_app/features/home/presentation/widgets/news_songs_loading_list.dart';

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
                loading: () => const NewsSongsLoadingList(),
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

