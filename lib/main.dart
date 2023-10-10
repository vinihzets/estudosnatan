import 'package:clean_arch_auth_with_bloc/core/utils/routes/const_routes.dart';
import 'package:clean_arch_auth_with_bloc/core/utils/routes/routes_builder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ConstRoutes constRoutes = ConstRoutes();
  runApp(MyApp(
    constRoutes: constRoutes,
  ));
}

class MyApp extends StatelessWidget {
  final ConstRoutes constRoutes;
  const MyApp({required this.constRoutes, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: RoutesBuilder.builder(constRoutes),
      initialRoute: constRoutes.loginView,
      debugShowCheckedModeBanner: false,
    );
  }
}
