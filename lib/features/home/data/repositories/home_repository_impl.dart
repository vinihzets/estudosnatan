import 'package:clean_arch_auth_with_bloc/features/home/data/datasources/home_datasources.dart';
import 'package:clean_arch_auth_with_bloc/features/home/data/model/contacts_model.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<List<ContactModel>> getContacts() {
    return dataSources.getContacts();
  }

  @override
  Future<ContactModel> addContact(String name, String email, String phone) {
    return dataSources.addContact(name, email, phone);
  }
}
