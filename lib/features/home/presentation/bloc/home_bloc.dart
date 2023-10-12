import 'package:clean_arch_auth_with_bloc/core/bloc/bloc.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/add_contact_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:clean_arch_auth_with_bloc/features/home/presentation/bloc/home_event.dart';

import '../../data/model/contacts_model.dart';

class HomeBloc extends Bloc {
  GetContactsUsecaseImpl getContactsUsecase;
  AddContactUsecaseImpl addContactUseCase;

  late List<ContactModel> listContacts;

  HomeBloc({
    required this.getContactsUsecase,
    required this.addContactUseCase,
  }) {
    listContacts = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventGetContacts) {
      _getContacts();
    } else if (event is HomeEventAddContact) {
      _addContact(event.email, event.name, event.phone);
    }
  }

  _getContacts() async {
    final result = await getContactsUsecase.getContacts().then((value) {
      if (value.isEmpty) {
        dispatchState(BlocEmptyState(data: null));
      } else {
        listContacts.addAll(value);

        dispatchState(BlocStableState(data: listContacts));
      }
    });
  }

  Future _addContact(String email, String name, String phone) async {
    await addContactUseCase.addContact(email, name, phone).then((value) {
      listContacts.add(value);
      dispatchState(BlocStableState(data: listContacts));
    });
  }
}
