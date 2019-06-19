import 'dart:io';
import 'package:dio/dio.dart';
import 'revan_response.dart';
import '../config/api_domain.dart';

class RevanHttp {

  static var dio = Dio(
    BaseOptions(
      baseUrl: APIDomain.API_DOMAIN,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: ContentType.json,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.plain,
    )

  );

  /*
  * GET请求
  **/
  static Future GET(String url, Map<String, dynamic> parameters) async {

    try {

      Response<Map> response = await dio.get(
        url,
        queryParameters: parameters,
        options: Options(responseType: ResponseType.json),
      );
      print('RevanResponse请求结构：${RevanResponse.fromJson(response.data)}');
      return RevanResponse.fromJson(response.data);
    }
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      }
      else {
        print(e.request);
        print(e.message);
      }
      print('请求失败:${e.message}');
      return RevanResponse(-2972, '网络断开', {});
    }
  }

  /*
  * POST请求
  **/
  static Future POST(String url, Map<String, dynamic> parameters) async {

    Response<Map> response = null;
    try {
      response = await dio.post(
        url,
        queryParameters: parameters,
        // Send data with "application/x-www-form-urlencoded" format
        options: new Options(
            contentType: ContentType.parse("application/x-www-form-urlencoded")
        ),
      );
      return RevanResponse.fromJson(response.data);
    }
    on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      }
      else {
        print(e.request);
        print(e.message);
      }
      print('请求失败:${e.message}');
      return response;
    }

  }

}
