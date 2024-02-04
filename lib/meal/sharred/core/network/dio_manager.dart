// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:meal_task/meal/sharred/constants/app_values.dart';

class DioManager {
  static Dio dio = Dio(
    BaseOptions(baseUrl: AppValues.baseUrl, receiveDataWhenStatusError: true),
  );
  DioManager();

  static Future<Response> getDataWithToken(
      {required String path,
      Map<String, dynamic>? query,
      required String tokenid}) async {
    return await dio.get(path,
        queryParameters: query,
        options: Options(headers: {"Authorization": "Bearer " + tokenid}));
  }

  static Future<Response> getData(
      {required String path, Map<String, dynamic>? query}) async {
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postImageDataWithToken(
      {required String path,
      required FormData data,
      required String tokenid}) async {
    // dio.options.headers = {
    //   'Authorization': tokenid ?? '',
    // };
    return await dio.post(path,
        data: data,
        options: Options(headers: {"Authorization": "Bearer " + tokenid}));
  }

  static Future<Response> PostDataWithToken({
    required String path,
    Map<String, dynamic>? data,
    required String tokenid,
  }) async {
    return await dio.post(path,
        data: data,
        options: Options(headers: {"Authorization": "Bearer " + tokenid}));
  }

//
  static Future<Response> postDataWithToken(
      {required String path,
      required Map<String, dynamic> data,
      required String tokenid}) async {
    return await dio.post(path,
        data: data,
        options: Options(headers: {"Authorization": "Bearer " + tokenid}));
  }

  static Future<Response> postData(
      {required String path, required Map<String, dynamic> data}) async {
    return await dio.post(path,
        data: data, options: Options(headers: {"Authorization": "Bearer "}));
  }

  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? data,
    required String tokenid,
  }) async {
    print("dio  " + path.toString());
    print(data.toString());
    print(tokenid);
    return await dio.put(path,
        data: data,
        options: Options(headers: {"Authorization": "Bearer " + tokenid}));
  }
}
