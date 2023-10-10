import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';
import 'package:flutter/material.dart';

class LoginEvent extends Event {}

class LoginEventOnReady implements LoginEvent {}

class SignInEvent implements LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  final GlobalKey<FormState> key;

  SignInEvent(
    this.email,
    this.password,
    this.context,
    this.key,
  );
}

class LoginEventNavigate implements LoginEvent {
  final BuildContext context;

  LoginEventNavigate(this.context);
}
