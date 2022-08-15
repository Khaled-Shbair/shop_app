import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/api paths.dart';
import '../../api/dio helper.dart';
import '../../models/category.dart';
import '../../models/home model.dart';
import '../../screens/categories/categories screen.dart';
import '../../screens/favorites/favorites screen.dart';
import '../../screens/products/products screen.dart';
import '../../screens/settings/settings screen.dart';
import '../../shared preferences/pref controller.dart';

class ShopGet extends GetxController {
  static ShopGet get to => Get.find();
  RxBool loading = false.obs;
  RxInt currentIndex = 0.obs;
  final RxMap<int, bool> listFavorites = <int, bool>{}.obs;
  late HomeModel homeModel;
  late Category category;
  final RxList<Widget> bottomScreen = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;


  void changeBottom(int index) {
    currentIndex.value = index;
  }

  Future<void> getHomeData() async {
    loading.value = true;
    await DioHelper.getData(
      url: ApiPaths.home,
      token: PrefController().token,
      query: null,
    ).then((value) {
      loading.value = false;
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel.data.products) {
        listFavorites.addAll(
          {
            element.id: element.inFavorites,
          },
        );
      }
    });
  }

  Future<void> getCategoryData() async {
    loading.value = true;
    await DioHelper.getData(url: ApiPaths.categories, query: null)
        .then((value) {
      loading.value = false;
      category = Category.fromJson(value.data);
    });
  }
}
