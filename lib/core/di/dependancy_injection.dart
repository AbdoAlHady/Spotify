import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/services/firbase_auth_service.dart';
import 'package:spotify_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';
import 'package:spotify_app/features/auth/dmoain/usecases/signup_usecase.dart';

import '../../features/auth/dmoain/usecases/signin_usecase.dart';
import '../services/firestore_service.dart';

final getIt = GetIt.instance;

Future<void> initDepedencies() async {
  // Firestore Service
  getIt.registerSingleton<FireStoreService>(FireStoreService());
  //Firebase Auth Service
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // Auth Repository
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt(), getIt()));
 // SignUp UseCase
  getIt.registerSingleton<SignupUsecase>(SignupUsecase(getIt()));
  // SignIn UseCase
  getIt.registerSingleton<SigninUsecase>(SigninUsecase(getIt()));





}
