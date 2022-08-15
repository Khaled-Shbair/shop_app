import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api paths.dart';
import '../../api/dio helper.dart';
import '../../models/category.dart';
import 'category state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  CategoryCubit get(context) => BlocProvider.of(context);
  late Category category;

  void getCategoryData() {
    emit(CategoryLoadingState());
    DioHelper.getData(url: ApiPaths.categories, query: null).then((value) {
      category = Category.fromJson(value.data);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState());
    });
  }
}
