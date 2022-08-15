import 'package:get/get.dart';

import '../../api/api paths.dart';
import '../../api/dio helper.dart';
import '../../models/login model.dart';
import '../../shared preferences/pref controller.dart';

class SettingGet extends GetxController {
  static SettingGet get to => Get.find();
  RxBool loading = false.obs;
  late LoginModel user;
  List<Data> list = <Data>[].obs;

  @override
  void onInit() {
    users();
   // getProfileData();
    super.onInit();
  }

  Future<List<Data>> users() async {
    loading.value = true;
    var response;
    response = await DioHelper.getData(
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
