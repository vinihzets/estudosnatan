import 'package:clean_arch_auth_with_bloc/features/login/domain/repositories/login_repository.dart';
import 'package:clean_arch_auth_with_bloc/features/login/domain/usecases/signin_usecase.dart';

class SignInUseCaseImpl implements SignInUseCase {

  LoginRepository repository;

  SignInUseCaseImpl(this.repository);

  @override
  signIn(String email, String password) {
    return repository.signIn(email, password);
  }

}