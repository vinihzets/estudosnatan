import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/features/home/data/datasources/remote/home_datasources_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/data/repositories/home_repository_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/add_contact_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/bloc/home_event.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/ui/home_view_stable_state.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeBloc bloc = HomeBloc(
      getContactsUsecase:
          GetContactsUsecaseImpl(HomeRepositoryImpl(HomeDatasourcesImpl())),
      addContactUseCase:
          AddContactUsecaseImpl(HomeRepositoryImpl(HomeDatasourcesImpl())));

  @override
  void initState() {
    bloc.dispatchEvent(HomeEventGetContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.state,
      builder: (context, snapshot) {
        if (snapshot.data is BlocStableState) {
          return HomeViewStableState(list: snapshot.data!.data, bloc: bloc,);
        } else if (snapshot.data is BlocEmptyState) {}

        return Container();
      },
    );
  }
}
