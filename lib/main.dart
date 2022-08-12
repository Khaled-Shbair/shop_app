import 'package:flutter/material.dart';

import 'api/dio.dart';
import 'app routes.dart';

void main() {
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
