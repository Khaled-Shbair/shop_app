import 'package:get/get.dart';

import '../api/api_paths.dart';
import '../api/dio_settings.dart';
import '../models/login_model.dart';
import '../shared preferences/pref controller.dart';

/*
  TODO: Remember => Not used yet => (Review late)
 */
class SettingGet extends GetxController {
  static SettingGet get to => Get.find();
  RxBool loading = false.obs;
  late LoginModel user;
  List<UserData> list = <UserData>[].obs;

  @override
  void onInit() {
    users();
    // getProfileData();
    super.onInit();
  }

  Future<List<UserData>> users() async {
    loading.value = true;
    var response;
    response = await DioSettings.getData(
      url: ApiPaths.profile,
      token: PrefController().token,
      query: null,
    ).then((value) {
      loading.value = false;
      var json = response.data;
      return LoginModel.fromJson(value.data);
    });
    return [];
  }

//void getProfileData() async {
//  var user=users();
//  if(user!=null){
//    list.va=user;
//    print(list);
//  }
//  else{
//    print('nulllllllll');
//  }
//}
}
