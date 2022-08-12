import 'package:flutter/material.dart';
import 'package:shop_app/api/response.dart';
import 'package:shop_app/utils/helpers.dart';

import 'api paths.dart';
import 'dio.dart';

class Controller with helpers {
  Future<void> login(BuildContext context, String routeName,
      {required String email, required String password}) async {
    ApiResponse apiResponse = await DioHelper.postData(
      url: ApiPaths.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }
}
