import 'package:get/get.dart';
import 'package:shop_app/api/api_paths.dart';
import 'package:shop_app/api/dio_settings.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/shared%20preferences/pref_controller.dart';

class SearchGet extends GetxController {
  static SearchGet get to => Get.find();
  RxBool loading = false.obs;
  SearchModel? searchModel;

  void search(String text) {
    loading.value = true;
    DioSettings.postData(
        url: ApiPaths.productSearch,
        token: PrefController().token,
        data: {
          'text': text,
        }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      loading.value = false;
    });
  }
}
