import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/login%20screen.dart';
import 'package:shop_app/screens/register/register%20screen.dart';
import 'api/dio helper.dart';
import 'app routes.dart';
import 'shared preferences/pref controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefController().initPrefController();
  DioHelper.init();
  runApp(MyApp(appRoutes: AppRouters()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoutes}) : super(key: key);

  final AppRouters appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.onGenerateRoute,
    );
  }
}
