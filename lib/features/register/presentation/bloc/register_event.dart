import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';
import 'package:flutter/material.dart';

class RegisterEvent extends Event {}

class OnReadyEvent implements RegisterEvent {}

class SignUpEvent implements RegisterEvent {
  final String email;
  final String password;
  final BuildContext context;
  final GlobalKey<FormState> key;


  SignUpEvent({required this.email, required this.password, required this.context, required this.key});
}

class RegisterEventNavigatePop implements RegisterEvent {
  BuildContext context;

  RegisterEventNavigatePop(this.context);
}
