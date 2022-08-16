import 'package:dio/dio.dart';
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
    required Map<String, dynamic>? query,
    String token = '',
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String token = '',
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.post(url, data: data);
  }
}
