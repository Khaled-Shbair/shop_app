import 'dart:async';

import 'package:get/get.dart';
import 'package:shop_app/api/api response.dart';
import 'package:shop_app/models/login%20model.dart';
import '../shared preferences/pref controller.dart';
import 'api paths.dart';
import 'dio helper.dart';

class AuthApiController extends GetxController {
  static AuthApiController get to => Get.find();

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
    var response = await DioHelper.postData(url: ApiPaths.register, data: {
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
    var response = await DioHelper.postData(
      url: ApiPaths.logout,
      token: PrefController().token,
      data: {},
    );

    if (response.statusCode == 200 || response.statusCode == 401) {
      unawaited(PrefController().clear());
      if (response.statusCode == 200) {
        return ApiResponse(
            message: response.data['message'], status: response.data['status']);
      } else {
        return ApiResponse(message: 'Logged out successfully', status: true);
      }
    }
    return ApiResponse(
      message: 'Something went wrong, try again',
      status: false,
    );
  }
}
