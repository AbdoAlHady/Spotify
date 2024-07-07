import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/di/dependancy_injection.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:spotify_app/features/auth/presentation/widgets/sign_up/sign_up_body_bloc_consumer.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: const SignUpBodyBlocConsumer(),
    );
  }
}

