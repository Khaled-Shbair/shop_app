import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/shop%20bloc/shop%20cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategoryData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.onGenerateRoute,
      ),
    );
  }
}
