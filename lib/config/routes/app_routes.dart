import 'package:flutter/material.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/features/authentication/presentation/pages/login_page.dart';
import 'package:nike/features/authentication/presentation/pages/register_page.dart';
import 'package:nike/features/home/presentation/pages/home_page.dart';
import 'package:nike/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:nike/features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case AppConstants.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case AppConstants.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case AppConstants.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case AppConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
