class ContactModel {
  final String email;
  final String name;
  final String phone;

  ContactModel({required this.email, required this.name, required this.phone});

  factory ContactModel.fromMap(dynamic map) {
    return ContactModel(
        email: map['email'], name: map['name'], phone: map['phone']);
  }
}

toMap(ContactModel model) {
  return {'email': model.email, 'name': model.name, 'phone': model.phone};
}
