import 'package:clean_arch_auth_with_bloc/features/register/domain/repositories/register_repository.dart';

import 'signup_usecase.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  RegisterRepository repository;

  SignUpUsecaseImpl(this.repository);

  @override
  signUp(String email, String password) {
    return repository.signUp(email, password);
  }
}
