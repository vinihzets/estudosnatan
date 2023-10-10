import 'package:clean_arch_auth_with_bloc/core/bloc/bloc.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/bloc/home_event.dart';

class HomeBloc extends Bloc {
  GetContactsUsecaseImpl getContactsUsecase;

  HomeBloc({required this.getContactsUsecase});

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventGetContacts) {
      getContacts();
    }
  }

  getContacts() async {
    final result = await getContactsUsecase.getContacts().then((value) {
      if (value.isEmpty) {
        dispatchState(BlocEmptyState(data: null));
      } else {
        dispatchState(BlocStableState(data: value));
      }
    });
  }
}
