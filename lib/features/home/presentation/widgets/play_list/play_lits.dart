import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/features/home/presentation/cubit/play_list/play_list_cubit.dart';
import 'package:spotify_app/features/home/presentation/cubit/play_list/play_list_state.dart';
import 'package:spotify_app/features/home/presentation/widgets/play_list/play_list_songs_list_view.dart';

import 'play_list_loading_list.dart';


class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit(getIt())..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          return state.when(
              loading: () {
                return const PlayListLoadingList();
              },
              success: (songs) {
                return PlayListSongsListView(songs: songs);
              },
              failure: Text.new);
        },
      ),
    );
  }
}
