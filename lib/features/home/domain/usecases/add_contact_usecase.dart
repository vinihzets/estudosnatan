import '../../data/model/contacts_model.dart';

abstract class AddContactUsecase {
 Future<ContactModel> addContact(String email, String name, String phone);
}
