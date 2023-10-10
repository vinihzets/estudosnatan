import 'package:clean_arch_auth_with_bloc/core/utils/form_builder_validators.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_bloc.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';

class LoginViewStableState extends StatefulWidget {
  final LoginBloc bloc;
  const LoginViewStableState({required this.bloc, super.key});

  @override
  State<LoginViewStableState> createState() => _LoginViewStableStateState();
}

class _LoginViewStableStateState extends State<LoginViewStableState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) =>
                    FormBuilderValidators.emailValidator(value),
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'E-mail', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) =>
                    FormBuilderValidators.passwordValidator(value),
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatchEvent(SignInEvent(
                        emailController.text,
                        passwordController.text,
                        context,
                        _globalKey,
                      ));
                    },
                    child: const Text('Logar')),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    widget.bloc.dispatchEvent(LoginEventNavigate(context));
                  },
                  child: const Text('Cadastre-se'))
            ],
          ),
        ),
      ),
    );
  }
}
