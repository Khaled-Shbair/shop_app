import 'package:flutter/material.dart';
import 'package:shop_app/shared%20preferences/pref%20controller.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      //child: Text('favorites Screen'),
      child: Text(PrefController().token),
    //  child: Text('${PrefController().loggedIn}'),
    );
  }
}
