import 'package:shop_app/api/api response.dart';
import 'package:shop_app/models/login%20model.dart';
import '../shared preferences/pref controller.dart';
import 'api paths.dart';
import 'dio helper.dart';

class ApiController {
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    var response = await DioHelper.postData(
      url: ApiPaths.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        if (loginModel.status == true) {
          PrefController().saveDataLogin(value: loginModel);
        }
      }
      return ApiResponse(
        message: response.data['message'],
        status: response.data['status'],
      );
    }
    return ApiResponse(
      message: 'Something went wrong, try again',
      status: false,
    );
  }
//Future <ApiResponse>logout()async{
//
//}
}
/*
static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
    String token = '',
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
// var response = await dio.get(url, queryParameters: query);
// if (response.statusCode == 200 || response.statusCode == 400) {
//   return ApiResponse(
//       message: response.data['message'], status: response.data['status']);
// }
// return ApiResponse(
//   message: 'Something went wrong, try again',
//   status: false,
// );
  }
 */