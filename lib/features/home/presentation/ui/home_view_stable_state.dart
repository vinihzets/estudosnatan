import 'dart:developer';

import 'package:clean_arch_auth_with_bloc/features/home/presentation/bloc/home_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class HomeViewStableState extends StatefulWidget {
  final List list;
  final HomeBloc bloc;
  const HomeViewStableState(
      {required this.list, required this.bloc, super.key});

  @override
  State<HomeViewStableState> createState() => _HomeViewStableStateState();
}

class _HomeViewStableStateState extends State<HomeViewStableState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return Text(widget.list[index].name);
                }),
            ElevatedButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Novo contato'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: nameController,
                                ),
                                TextField(
                                  controller: phoneController,
                                ),
                                TextField(
                                  controller: emailController,
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('cancelar')),
                              ElevatedButton(
                                  onPressed: () {
                                    widget.bloc.dispatchEvent(
                                        HomeEventAddContact(
                                            email: emailController.text,
                                            name: nameController.text,
                                            phone: phoneController.text));
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ok')),
                            ],
                          ));
                },
                child: const Text('Adicionar novo contato'))
          ],
        ));
  }
}
