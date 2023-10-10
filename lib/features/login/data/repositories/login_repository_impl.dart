import 'package:clean_arch_auth_with_bloc/features/login/data/datasources/login_datasources.dart';
import 'package:clean_arch_auth_with_bloc/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSources dataSources;

  LoginRepositoryImpl(this.dataSources);

  @override
  signIn(String email, String password) {
    return dataSources.signIn(email, password);
  }
}
