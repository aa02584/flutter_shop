import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:provide/provide.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Provide<DetailsInfoProvide>(
//      builder: (context,child,val){
//        var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodsInfo;
//        if (goodsInfo !=null) {
//          return Container(
//            color: Colors.white,
//            child: Column(
//              children: <Widget>[
//                _goodsImage("白酒"),
//                _goodsName("白酒"),
//                _goodsNum("234234324")
//              ],
//            ),
//          );
//
//        }
//
//      },
//    );

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _goodsImage("白酒"),
          _goodsName("白酒"),
          _goodsNum("234234324")
        ],
      ),
    );
  }

  Widget _goodsImage(url) {
    return Image.asset(
      Utils.getImgPath("banner_test1"),
      width: ScreenUtil().setWidth(750),
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        "编号：$num",
        style: TextStyle(color: Colors.black12),
      ),
    );
  }
}
