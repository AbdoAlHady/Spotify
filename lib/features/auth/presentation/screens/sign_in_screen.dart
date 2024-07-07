import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:spotify_app/features/auth/presentation/widgets/sign_in/sing_in_bloc_consumer.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt()),
      child: const SignInBlocConsumer(),
    );
  }
}

