import '../../../../core/bloc/event.dart';

class HomeEvent extends Event {}

class HomeEventGetContacts implements HomeEvent {}

class HomeEventAddContact implements HomeEvent {
  final String email;
  final String name;
  final String phone;

  HomeEventAddContact({
    required this.email,
    required this.name,
    required this.phone,
  });
}
