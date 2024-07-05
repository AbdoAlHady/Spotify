import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/routing/app_router.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/choose_mode/presentation/bloc/theme_cubit.dart';

import 'core/configs/theme/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                themeMode: mode,
                darkTheme: AppTheme.darkTheme,
                onGenerateRoute: appRouter.onGenerateRoute,
                initialRoute: Routes.splashScreen,
              );
            },
          ),
        );
      },
    );
  }
}
