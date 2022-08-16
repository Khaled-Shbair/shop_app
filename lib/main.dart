import 'package:flutter/material.dart';
import 'api/dio_settings.dart';
import 'app routes.dart';
import 'shared preferences/pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefController().initPrefController();
  DioSettings.init();
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
