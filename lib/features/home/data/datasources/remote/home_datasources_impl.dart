import 'package:clean_arch_auth_with_bloc/features/home/data/datasources/home_datasources.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/contacts_model.dart';

class HomeDatasourcesImpl implements HomeDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<ContactModel>> getContacts() async {
    final docs = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .get();

    return [ContactModel(email: 'joao', name: 'joao', phone: '62')];
  }

  @override
  Future<ContactModel> addContact(
      String name, String email, String phone) async {
    final model = ContactModel(email: email, name: name, phone: phone);

    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .add(toMap(model));

    return model;
  }
}
