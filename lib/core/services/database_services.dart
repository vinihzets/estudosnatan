import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final users = FirebaseFirestore.instance.collection('users');
}
