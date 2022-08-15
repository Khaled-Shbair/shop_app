import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories/categories%20screen.dart';
import 'package:shop_app/screens/favorites/favorites%20screen.dart';
import 'package:shop_app/screens/on%20boarding/on%20boarding%20screen.dart';
import 'package:shop_app/screens/register/register%20screen.dart';
import 'package:shop_app/screens/search/search%20screen.dart';
import 'package:shop_app/screens/settings/settings%20screen.dart';

import 'constants/string.dart';
import 'screens/login/login screen.dart';
import 'screens/products/products screen.dart';
import 'screens/shop layout.dart';
import 'shared preferences/pref controller.dart';

class AppRouters {
  final bool _onBoarding = PrefController().onBoarding;
  final String _token = PrefController().token;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case categoriesScreen:
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
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
      default:
       // if (_onBoarding) {
       //   if (_token.isNotEmpty) {
       //     return MaterialPageRoute(builder: (context) => const ShopLayout());
       //   }
       //   return MaterialPageRoute(builder: (context) => const LoginScreen());
       // }
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
