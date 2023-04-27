// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'Constant&endPoints.dart';

const String APPLICATION_JSON = "json";

const String ACCEPT = "Accept";

const int apiTimeOut = 6000;

class DioFactory {
  static late Dio dio;
  static Future getDio() async {
    dio = Dio();

    Map<String, String> headers = {
      ACCEPT: APPLICATION_JSON,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
      sendTimeout: const Duration(milliseconds: apiTimeOut),
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  static Future<Response> getdata({
    required String url,
    dynamic quary,
  }) async {
    return await dio.get(
      url,
      queryParameters: quary,
    );
  }

  static Future<Response> postdata({
    required String url,
    dynamic quary,
    dynamic data,
  }) async {
    return await dio.post(url, queryParameters: quary, data: data);
  }

  static Future<Response> putdata({
    required String url,
    dynamic quary,
    required dynamic data,
  }) async {
    return await dio.put(url, queryParameters: quary, data: data);
  }

  static Future<Response> patchdata({
    required String url,
    dynamic quary,
    required dynamic data,
  }) async {
    return await dio.patch(url, queryParameters: quary, data: data);
  }
}
