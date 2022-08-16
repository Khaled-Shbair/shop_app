import 'dart:async';
import 'package:get/get.dart';
import 'package:shop_app/api/api_response.dart';
import '../models/login_model.dart';
import '../shared preferences/pref controller.dart';
import '../api/api_paths.dart';
import '../api/dio_settings.dart';

class AuthApiGetXController extends GetxController {
  static AuthApiGetXController get to => Get.find();

  Future<ApiResponse> login(
      {required String email, required String password}) async {
    var response = await DioSettings.postData(
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
          PrefController().saveLogin(value: true);
          PrefController().saveToken(token: loginModel.data!.token);
          update();
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

  Future<ApiResponse> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    var response = await DioSettings.postData(url: ApiPaths.register, data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 201) {
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

  Future<ApiResponse> logout() async {
    var response = await DioSettings.postData(
      url: ApiPaths.logout,
      data: {},
      token: PrefController().token,
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      PrefController().saveLogin(value: false);
      PrefController().saveToken(token: '');
      return ApiResponse(
          message: response.data['message'], status: response.data['status']);
    }
    return ApiResponse(
      message: 'Something went wrong, try again',
      status: false,
    );
  }
}
