import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/services/firbase_auth_service.dart';
import 'package:spotify_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spotify_app/features/auth/dmoain/repos/auth_repo.dart';
import 'package:spotify_app/features/auth/dmoain/usecases/signup_usecase.dart';
import 'package:spotify_app/features/home/domain/usecases/get_play_list_use_case.dart';

import '../../features/auth/dmoain/usecases/signin_usecase.dart';
import '../../features/home/data/repos/home_repo_imple.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/usecases/get_news_songs_use_case.dart';
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

  //! Home Dependance
  // Home Repository
  getIt.registerSingleton<HomeRepo>(HomeRepoImple(getIt()));
  // Get New Songs UseCase
  getIt.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase(getIt()));
  // Get Play List UseCase
  getIt.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase(getIt()));
}
