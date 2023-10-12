import '../model/contacts_model.dart';

abstract class HomeDataSources {
 Future<List<ContactModel>> getContacts();

 Future<ContactModel> addContact(String name, String email, String phone);
}
