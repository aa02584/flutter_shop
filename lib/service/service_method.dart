import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_shop/config/service_url.dart';

Future request(url, {formData}) async {
  print("开始获取数据");
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/octet-stream;charset=gbk");
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常。");
    }
  } catch (e) {
    return print("error.===========$e");
  }
}

