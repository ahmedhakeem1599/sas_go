import 'package:flutter/material.dart';
import 'package:sas_go/features/auth/pres/screens/entry.dart';
import 'package:sas_go/features/auth/pres/screens/on_boarding_screen.dart';
import '../../features/auth/pres/screens/login_or_register_screen.dart';
import '../../features/auth/pres/screens/login_screen.dart';
import '../../features/auth/pres/screens/register_screen.dart';
import '../../features/auth/pres/screens/selection_type_screen.dart';
import 'app_routes.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutes.entry:
        return _buildRoute(const EntryScreen());

      case AppRoutes.onboarding:
        return _buildRoute(const OnBoardingScreen());

      case AppRoutes.loginOrRegisterScreen:
        return _buildRoute(const LoginOrRegisterScreen());

      case AppRoutes.loginScreen:
        return _buildRoute(const LoginScreen());

      case AppRoutes.selectionTypeScreen:
        return _buildRoute(const SelectionTypeScreen());

      case AppRoutes.registerScreen:
        final rule = settings.arguments as int;
        return _buildRoute(RegisterScreen(rule: rule));

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
