import 'package:shop_app/models/login%20model.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ChangeBottomNavState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {}

class CategoryLoadingState extends ShopState {}

class CategoriesSuccessState extends ShopState {}

class CategoriesErrorState extends ShopState {}

class ProfileLoadingState extends ShopState {}

class ProfileSuccessState extends ShopState {
  final LoginModel loginModel;

  ProfileSuccessState(this.loginModel);
}

class ProfileErrorState extends ShopState {}
