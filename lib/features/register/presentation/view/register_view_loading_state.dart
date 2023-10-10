import 'package:flutter/material.dart';

class RegisterViewLoadingState extends StatefulWidget {
  const RegisterViewLoadingState({super.key});

  @override
  State<RegisterViewLoadingState> createState() =>
      _RegisterViewLoadingStateState();
}

class _RegisterViewLoadingStateState extends State<RegisterViewLoadingState> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
