import 'package:clean_arch_auth_with_bloc/features/register/data/datasources/register_datasources.dart';
import 'package:clean_arch_auth_with_bloc/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
 RegisterDataSources datasources;
 RegisterRepositoryImpl(this.datasources);

@override
 signUp(String email, String password){
  return datasources.signUp(email, password);

  }

}