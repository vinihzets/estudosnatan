import 'package:clean_arch_auth_with_bloc/features/home/data/datasources/home_datasources.dart';
import 'package:clean_arch_auth_with_bloc/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  getContacts() {
    return dataSources.getContacts();
  }
}
