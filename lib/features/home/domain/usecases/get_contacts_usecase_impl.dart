import 'package:clean_arch_auth_with_bloc/features/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/usecases/get_contacts_usecase.dart';

class GetContactsUsecaseImpl implements GetContactsUsecase {
  HomeRepository repository;

  GetContactsUsecaseImpl(this.repository);

  @override
  Future getContacts() {
    return repository.getContacts();
  }
}
