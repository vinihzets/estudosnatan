import 'package:clean_arch_auth_with_bloc/core/utils/routes/const_routes.dart';
import 'package:clean_arch_auth_with_bloc/features/login/data/datasources/remote/login_datasources_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/login/data/repositories/login_repository_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/login/domain/usecases/signin_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_bloc.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_event.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/view/login_view_stable_state.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginBloc bloc = LoginBloc(SignInUseCaseImpl(LoginRepositoryImpl(LoginDataSourcesImpl())));

  @override
  void initState() {
    bloc.dispatchEvent(LoginEventOnReady());
    super.initState();
  }

  ConstRoutes constRoutes = ConstRoutes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.state,
        builder: (context, snapShot){
          if (snapShot.hasData){
            return LoginViewStableState(
              bloc: bloc,
            );
          }
          return Container();
      })
    );
  }
}