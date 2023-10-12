import '../../data/model/contacts_model.dart';

abstract class GetContactsUsecase {
  Future<List<ContactModel>> getContacts();
}
