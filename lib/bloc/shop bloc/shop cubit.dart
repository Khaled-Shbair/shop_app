import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/api/api%20paths.dart';
import 'package:shop_app/api/dio%20helper.dart';
import 'package:shop_app/bloc/shop%20bloc/shop%20states.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories/categories%20screen.dart';
import 'package:shop_app/screens/favorites/favorites%20screen.dart';
import 'package:shop_app/screens/products/products%20screen.dart';
import 'package:shop_app/screens/settings/settings%20screen.dart';

import '../../models/category.dart';
import '../../models/home model.dart';
import '../../shared preferences/pref controller.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitialState());

  ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  late HomeModel homeModel;
  late Category category;
  final List<Widget> bottomScreen = const [
    ProductsScreen(),
    CategoriesScreen(),
    SettingsScreen(),
    FavoritesScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void getHomeData() {
    emit(ShopLoadingState());
    DioHelper.getData(
            url: ApiPaths.home, token: PrefController().token, query: null)
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(ShopSuccessState());
    }).catchError((error) {
      emit(ShopErrorState());
    });
  }

  void getCategoryData() {
    emit(ShopLoadingState());
    DioHelper.getData(
            url: ApiPaths.categories,
            token: PrefController().token,
            query: null)
        .then((value) {
      category = Category.fromJson(value.data);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState());
    });
  }
}
