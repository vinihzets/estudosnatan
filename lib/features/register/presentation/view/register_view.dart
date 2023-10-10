import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/features/register/domain/usecases/signup_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/register/presentation/view/register_view_loading_state.dart';
import 'package:clean_arch_auth_with_bloc/features/register/presentation/view/register_view_stable_state.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/remote/register_datasources_impl.dart';
import '../../data/repositories/register_repository_impl.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterBloc bloc = RegisterBloc(
      SignUpUsecaseImpl(RegisterRepositoryImpl(RegisterDataSourcesImpl())));

  @override
  void initState() {
    bloc.dispatchEvent(OnReadyEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.state,
          builder: (context, snapshot) {
            if (snapshot.data is BlocStableState) {
              return RegisterViewStableState(
                bloc: bloc,
              );
            } else if (snapshot.data is BlocLoadingState) {
              return const RegisterViewLoadingState();
            } else {
              return Container();
            }
          }),
    );
  }
}
