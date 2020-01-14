import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var goodsDetails =
//        Provide.value<DetailsInfoProvide>(context).goodsInfo.data;

    return Container(
      child: Html(
        data: "https://book.flutterchina.club/chapter1/flutter_intro.html",
      ),
    );
  }
}
