import 'package:breaking_bad_app/shared/components/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      // 'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }
}
