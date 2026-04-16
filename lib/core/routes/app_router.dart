import 'package:flutter/material.dart';
import 'package:sas_go/features/auth/pres/on_boarding_screen.dart';
import '../../features/auth/pres/login_or_register_screen.dart';
import '../../features/auth/pres/login_screen.dart';
import '../../features/auth/pres/register_screen.dart';
import '../../features/auth/pres/selection_type_screen.dart';
import 'app_routes.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutes.onboarding:
        return _buildRoute(const OnBoardingScreen());

      case AppRoutes.loginOrRegisterScreen:
        return _buildRoute(const LoginOrRegisterScreen());

      case AppRoutes.loginScreen:
        return _buildRoute(const LoginScreen());

      case AppRoutes.selectionTypeScreen:
        return _buildRoute(const SelectionTypeScreen());

      case AppRoutes.registerScreen:
        return _buildRoute(const RegisterScreen());

      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );

    }
  }

  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

}
