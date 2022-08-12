import 'package:flutter/material.dart';
import 'package:shop_app/screens/on%20boarding/on%20boarding%20screen.dart';

import 'constants/string.dart';
import 'screens/auth/login screen.dart';
import 'screens/main screen.dart';

class AppRouters {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
