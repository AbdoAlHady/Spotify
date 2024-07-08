abstract class BaseUseCase<Type, Paramters> {
  Future<Type> call({Paramters params});
}
