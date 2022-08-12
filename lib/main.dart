import 'package:flutter/material.dart';
import 'package:shop_app/screens/auth/login%20screen.dart';
import 'package:shop_app/screens/on%20boarding/on%20boarding%20screen.dart';

import 'api/dio helper.dart';
import 'app routes.dart';
import 'shared preferences/pref controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefController().initPrefController();
  DioHelper.init();
  runApp(MyApp(
    appRoutes: AppRouters(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,
    required this.appRoutes
  }) : super(key: key);

  final AppRouters appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRoutes.onGenerateRoute,
    );
  }
}
