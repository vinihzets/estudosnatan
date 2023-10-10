import 'package:clean_arch_auth_with_bloc/features/login/data/datasources/login_datasources.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginDataSourcesImpl implements LoginDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future signIn(String email, String password) async{
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

}