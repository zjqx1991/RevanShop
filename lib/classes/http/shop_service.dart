import 'dart:async';
import 'revan_api.dart';
import 'revan_http.dart';
import 'revan_response.dart';

Future getHomePageData() async {

  print('首页请求数据: 开始请求。。。。。。');
  try {
    RevanResponse response = await RevanHttp.POST(
        RevanApi.HOME_PAGE,
        {'lon':'115.02932','lat':'35.76189'}
        );
    return response;
  }
  catch (e) {
    print('首页数据请求失败:======> ${e}');
  }
}