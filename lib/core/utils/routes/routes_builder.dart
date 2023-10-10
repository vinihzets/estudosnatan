import 'package:clean_arch_auth_with_bloc/core/utils/routes/const_routes.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/view/login_view.dart';
import 'package:clean_arch_auth_with_bloc/features/register/presentation/view/register_view.dart';

class RoutesBuilder {
  static builder (ConstRoutes routes) {
    return {
      routes.loginView: (_) => const LoginView(),
      routes.registerView: (_) => const RegisterView(),
    };
  }
}