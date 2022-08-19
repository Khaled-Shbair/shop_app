import 'package:get/get.dart';

import '../api/api_paths.dart';
import '../api/dio_settings.dart';
import '../models/search_model.dart';


class SearchGet extends GetxController {
  static SearchGet get to => Get.find();
  RxBool loading = false.obs;
  final _searchModel = Rxn<SearchModel>();

  SearchModel? get searchModel => _searchModel.value;

  set searchModel(SearchModel? value) {
    _searchModel.value = value;
  }

  void search(String text) {
    loading.value = true;
    DioSettings.postData(
      url: ApiPaths.productSearch,
      data: {'text': text},
    ).then((value) {
      if (value.statusCode == 200) {
        searchModel = SearchModel.fromJson(value.data);
        loading.value = false;
      }
    });
  }
}
