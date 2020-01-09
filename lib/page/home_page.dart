import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter学习"),
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiper = (data["data"]["slides"] as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDateList: swiper),
                ],
              );
            } else {
              List<Map> swiper = List();
              List<Map> navigator = List();
              Map map = Map();
              navigator.add(map);
              Map map2 = Map();
              navigator.add(map2);
              Map map3 = Map();
              navigator.add(map3);
              Map map4 = Map();
              navigator.add(map4);
              Map map5 = Map();
              navigator.add(map5);
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDateList: swiper),
                  TopNavigator(navigatorList: navigator),
                  AdBanner(adPicture: "test"),
                  LeaderPhone(leaderImage: "", leaderPhone: ""),
                ],
              );
            }
          },
        ));
  }
}

// 首页轮播图
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({Key key, this.swiperDateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
//          return Image.network("${swiperDateList[index]["image"]}");
          return Image.asset(
            Utils.getImgPath("banner_test${index + 1}"),
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(), // 指示点
        autoplay: true,
      ),
    );
  }
}

// 分类
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("点击了导航");
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            Utils.getImgPath("banner_test1"),
            width: ScreenUtil().setWidth(95),
          ),
          Text("测试")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(160),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

// 广告模块
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Utils.getImgPath("banner_test2"),
          height: ScreenUtil().setHeight(100),
          width: ScreenUtil().setWidth(750),
          fit: BoxFit.fill),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Image.asset(
          Utils.getImgPath("banner_test1"),
        ),
      ),
    );
  }
}
