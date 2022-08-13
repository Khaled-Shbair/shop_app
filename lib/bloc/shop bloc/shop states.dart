abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ChangeBottomNavState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {
  // final String message;

  // ShopErrorState({required this.message});
}
