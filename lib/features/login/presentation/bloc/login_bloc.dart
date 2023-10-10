import 'package:clean_arch_auth_with_bloc/core/bloc/bloc.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';
import 'package:clean_arch_auth_with_bloc/core/utils/string_translator.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/ui/home_view.dart';
import 'package:clean_arch_auth_with_bloc/features/login/domain/usecases/signin_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc {
  SignInUseCaseImpl signIn;

  LoginBloc(this.signIn);

  @override
  mapListenEvent(Event event) {
    if (event is LoginEventOnReady) {
      _handleOnReady();
    } else if (event is SignInEvent) {
      _handleSignIn(event.email, event.password, event.context, event.key);
    } else if (event is LoginEventNavigate) {
      _handleNavigatePush(event.context);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  _handleSignIn(
    String email,
    String password,
    context,
    GlobalKey<FormState> key,
  ) async {
    if (key.currentState?.validate() ?? false) {
      try {
        final result = await signIn.signIn(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario logado com sucesso'),
          ),
        );

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeView()));
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(StringTranslator.build(e.toString()))));
      }
    }
  }

  _handleNavigatePush(context) {
    Navigator.pushNamed(context, '/register');
  }
}
