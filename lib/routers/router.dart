import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/router_handler.dart';

class Routers {
  static String root = "/";
  static String detailsPage = "/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ERROR===>ROUTE WAS NOT FOUNDN!!!");
        return Text("ERROR===>ROUTE WAS NOT FOUNDN!!!");
      },
    );

    // 配置路由
    router.define(detailsPage, handler: detailsHandler);
  }
}
