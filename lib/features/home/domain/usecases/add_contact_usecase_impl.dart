import 'package:clean_arch_auth_with_bloc/features/home/data/model/contacts_model.dart';

import '../repositories/home_repository.dart';
import 'add_contact_usecase.dart';

class AddContactUsecaseImpl implements AddContactUsecase {
  HomeRepository repository;

  AddContactUsecaseImpl(this.repository);

  @override
  Future<ContactModel> addContact(String email, String name, String phone) {
    return repository.addContact(name, email, phone);
  }
}
