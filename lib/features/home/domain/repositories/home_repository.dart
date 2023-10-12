import '../../data/model/contacts_model.dart';

abstract class HomeRepository {
 Future<List<ContactModel>> getContacts();

 Future<ContactModel> addContact(String name, String email, String phone);
}
