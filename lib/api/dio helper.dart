import 'package:dio/dio.dart';
import 'package:shop_app/api/api response.dart';

import 'api paths.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<ApiResponse> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    var response = await dio.get(url, queryParameters: query);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ApiResponse(
          message: response.data['message'], status: response.data['status']);
    }
    return ApiResponse(
      message: 'Something went wrong, try again',
      status: false,
    );
  }

  // static Future<ApiResponse> postData({
  //   required String url,
  //   required Map<String, dynamic> data,
  // }) async {
  //   var response = await dio.post(url, data: data);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     return ApiResponse(
  //         message: response.data['message'], status: response.data['status']);
  //   }
  //   return ApiResponse(
  //     message: 'Something went wrong, try again',
  //     status: false,
  //   );
  // }
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data);
  }
}
