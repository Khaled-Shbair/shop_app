import 'package:dio/dio.dart';
import 'package:shop_app/shared%20preferences/pref_controller.dart';

import 'api_paths.dart';

class DioSettings {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': PrefController().token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': PrefController().token,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
