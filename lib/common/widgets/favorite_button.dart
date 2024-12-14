import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/common/bloc/favorite_button/cubit/favorite_button_cubit.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';

import '../bloc/favorite_button/cubit/favorite_button_state.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FavoriteButtonCubit(getIt()),
        child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
          builder: (context, state) {
            if (state is InitialState) {
              return IconButton(
                onPressed: () {
                  context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                        songId: song.songId ?? '',
                      );
                },
                icon: Icon(
                  song.isFavorite ?? false
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color:
                      context.isDarkMode ? AppColors.lightDark : AppColors.gery,
                ),
              );
            } else if (state is SuccessState) {
              return IconButton(
                icon: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: state.isFavorite ? AppColors.lightDark : Colors.grey,
                ),
                onPressed: () {
                  context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                        songId: song.songId ?? '',
                      );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
