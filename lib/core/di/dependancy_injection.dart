import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/services/firbase_auth_service.dart';
import 'package:spotify_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';
import 'package:spotify_app/features/auth/dmoain/usecases/signup_usecase.dart';

final getIt = GetIt.instance;

Future<void> initDepedencies() async {
  //Firebase Auth Service
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // Auth Repository
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt()));
 // SignUp UseCase
  getIt.registerSingleton<SignupUsecase>(SignupUsecase(getIt()));



}
