//base url : https://lavie.orangedigitalcenteregypt.com
import 'package:dio/dio.dart';
import 'package:orange_pro0/shared/network/remote/end_pointes.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameter,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      url,
      queryParameters: queryParameter,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    required String token,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer $token'; //'Bearer ${$token}';
    return await dio!.get(
      url,
      queryParameters: data,
    );
  }

  // to upload image
  static Future<Response> uploadImage({
    required String url,
    required String token,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer $token'; //'Bearer ${$token}';
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> updateUserData({
    required String url,
    required String token,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers['Authorization'] =
        'Bearer $token'; //'Bearer ${$token}';
    return await dio!.patch(
      url,
      data: data,
    );
  }
}
