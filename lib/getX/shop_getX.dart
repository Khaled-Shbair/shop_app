import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import '../api/api_paths.dart';
import '../api/dio_settings.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/products/products screen.dart';
import '../screens/settings/settings screen.dart';
import '../shared preferences/pref controller.dart';

class ShopGet extends GetxController {
  static ShopGet get to => Get.find();
  RxBool loading = false.obs;
  RxInt currentIndex = 0.obs;
  final RxMap<int, bool> listFavorites = <int, bool>{}.obs;
  final RxList<Widget> bottomScreen = const [
    ProductsScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  HomeModel? homeModel;
  CategoryModel? category;

  void changeBottom(int index) {
    currentIndex.value = index;
  }

  Future<void> getHomeData() async {
    loading.value = true;
    await DioSettings.getData(
      url: ApiPaths.home,
      token: PrefController().token,
      query: null,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      loading.value = false;

      // TODO: Not User yet => use with favorites screen
      // for (var element in homeModel!.data.products) {
      //   listFavorites.addAll(
      //     {
      //       element.id: element.inFavorites,
      //     },
      //   );
      // }
    });
  }

  Future<void> getCategoryData() async {
    loading.value = true;
    await DioSettings.getData(url: ApiPaths.categories, query: null)
        .then((value) {
      category = CategoryModel.fromJson(value.data);
      loading.value = false;
    });
  }
}
