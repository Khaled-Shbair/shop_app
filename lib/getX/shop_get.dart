import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_paths.dart';
import '../api/dio_settings.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/products/products screen.dart';
import '../screens/settings/settings screen.dart';

class ShopGet extends GetxController {
  static ShopGet get to => Get.find();
  RxBool loading = false.obs;
  RxInt currentIndex = 0.obs;
  final RxList<Widget> bottomScreen = const [
    ProductsScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
    getHomeData();
  }

  void changeBottom(int index) {
    currentIndex.value = index;
  }

  final _listFavorites = RxMap<int, bool>();

  Map<int, bool> get listFavorites => _listFavorites;

  set listFavorites(Map<int, bool> value) {
    _listFavorites.value = value;
  }

  final _homeModel = Rxn<HomeModel>();

  HomeModel? get homeModel => _homeModel.value;

  set homeModel(HomeModel? value) {
    _homeModel.value = value;
  }

  void getHomeData() async {
    loading.value = true;
    var response = await DioSettings.getData(url: ApiPaths.home);
    if (response.statusCode == 200) {
      homeModel = HomeModel.fromJson(response.data);
      loading.value = false;
    }
    for (var element in homeModel!.data!.products!) {
      listFavorites.addAll(
        {element.id: element.inFavorites},
      );
    }
    // print(listFavorites.toString());
  }

  void changeFavorites(int productId) async {
    loading.value = true;
    await DioSettings.postData(
      url: ApiPaths.favorites,
      data: {'product_id': productId},
    ).then((value) {
      loading.value = false;
    });
  }

  final _category = Rxn<CategoryModel>();

  CategoryModel? get category => _category.value;

  set category(CategoryModel? value) {
    _category.value = value;
  }

  void getCategoryData() async {
    loading.value = true;
    var response = await DioSettings.getData(url: ApiPaths.categories);
    if (response.statusCode == 200) {
      category = CategoryModel.fromJson(response.data);
      loading.value = false;
    }
  }
}
