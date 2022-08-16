import 'package:flutter/material.dart';
import 'constants/string.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/favorites/favorites_screen.dart';
import 'screens/login/login screen.dart';
import 'screens/on boarding/on boarding screen.dart';
import 'screens/products/products screen.dart';
import 'screens/register/register screen.dart';
import 'screens/search/search screen.dart';
import 'screens/settings/settings screen.dart';
import 'screens/shop layout.dart';
import 'shared preferences/pref_controller.dart';

class AppRouters {
  final bool _onBoarding = PrefController().onBoarding;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case shopLayout:
        return MaterialPageRoute(builder: (context) => const ShopLayout());
      case settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case favoritesScreen:
        return MaterialPageRoute(builder: (context) => const FavoritesScreen());
      case productsScreen:
        return MaterialPageRoute(builder: (context) => const ProductsScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case categoriesScreen:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      default:
        if (_onBoarding) {
          if (PrefController().loggedIn) {
            return MaterialPageRoute(builder: (context) => const ShopLayout());
          }
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        }
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
