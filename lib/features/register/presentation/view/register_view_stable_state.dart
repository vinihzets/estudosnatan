import 'package:clean_arch_auth_with_bloc/core/utils/form_builder_validators.dart';
import 'package:clean_arch_auth_with_bloc/features/register/presentation/bloc/register_event.dart';
import 'package:flutter/material.dart';

import '../bloc/register_bloc.dart';

class RegisterViewStableState extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterViewStableState({required this.bloc, super.key});

  @override
  State<RegisterViewStableState> createState() =>
      _RegisterViewStableStateState();
}

class _RegisterViewStableStateState extends State<RegisterViewStableState> {
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
                obscureText: true,
                controller: passwordController,
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
                      widget.bloc.dispatchEvent(SignUpEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                          key: _globalKey));
                    },
                    child: const Text('Cadastre-se')),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    widget.bloc
                        .dispatchEvent(RegisterEventNavigatePop(context));
                  },
                  child: const Text('Faça login'))
            ],
          ),
        ),
      ),
    );
  }
}
