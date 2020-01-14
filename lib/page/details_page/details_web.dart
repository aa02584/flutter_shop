import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var goodsDetails =
//        Provide.value<DetailsInfoProvide>(context).goodsInfo.data;

    return Container(
      child: WebView(
        onWebViewCreated: (WebViewController webViewController) {},
        initialUrl: "https://www.zhibo8.cc/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}
