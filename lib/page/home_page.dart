import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
//    _getHotGoods();
    print("1111111");
  }

//  // 获取火爆专区数据
//  void _getHotGoods() {
//
////    var formPage = {"page": page};
////    request("homePageBelowConten", formData: formPage).then((val) {
////      var data = json.decode(val.toString());
////      List<Map> newGoodsList = (data['data'] as List).cast();
////      setState(() {
////        hotGoodsList.addAll(newGoodsList);
////        page++;
////      });
////    });
//  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5.0),
    child: Text("火爆专区"),
  );

  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  Utils.getImgPath("banner_test4"),
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  "测试商品",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text("¥ 39.00"),
                    Text(
                      "¥ 90.98",
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(spacing: 2, children: listWidget);
    } else {
      return Text("没有数据");
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter学习"),
        ),
        body: FutureBuilder(
          future: request("homePageContent", formData: ""),
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
              Map map6 = Map();
              navigator.add(map6);
              Map map7 = Map();
              navigator.add(map7);
              Map map8 = Map();
              navigator.add(map8);
              Map map9 = Map();
              navigator.add(map9);
              Map map10 = Map();
              navigator.add(map10);
              return EasyRefresh(
                refreshFooter: ClassicsFooter(
                  key: _footerkey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.pink,
                  showMore: true,
                  noMoreText: "",
                  moreInfo: "加载中..",
                  loadReadyText: "上拉加载",
                ),
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDateList: swiper),
                    TopNavigator(navigatorList: navigator),
                    AdBanner(adPicture: "test"),
                    LeaderPhone(leaderImage: "", leaderPhone: "10086"),
                    Recommend(recommendList: navigator),
                    FloorTitle(picture_address: ""),
                    FloorContent(floorGoodsList: navigator),
                    FloorTitle(picture_address: ""),
                    FloorContent(floorGoodsList: navigator),
                    _hotGoods(),
                  ],
                ),
                loadMore: () async {
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
                  Map map6 = Map();
                  navigator.add(map6);
                  Map map7 = Map();
                  navigator.add(map7);
                  Map map8 = Map();
                  navigator.add(map8);
                  Map map9 = Map();
                  navigator.add(map9);
                  Map map10 = Map();
                  navigator.add(map10);
                  setState(() {
                    hotGoodsList.addAll(navigator);
                    page++;
                  });
                },
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
      height: ScreenUtil().setHeight(280),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
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

// 店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        InkWell(
          onTap: _launcherUrl,
          child: Image.asset(
            Utils.getImgPath("banner_test1"),
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setWidth(750),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "打电话",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontSize: 20),
        )
      ],
    );
  }

  void _launcherUrl() async {
    String url = "tel:" + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "url不能进行访问，异常";
    }
  }
}

// 横向滚动
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  ///
  /// 标题
  ///
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  /// 商品单独项方法
  Widget _item() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(Utils.getImgPath("banner_test2")),
            Text("¥ 19.00"),
            Text(
              "¥ 29.00",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 横向列表方法
  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }
}

// 楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;

  FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              Utils.getImgPath("banner_test3"),
              height: ScreenUtil().setHeight(160),
              width: ScreenUtil().setWidth(750),
              fit: BoxFit.fill,
            ),
            Text(
              "大标题",
              style: TextStyle(color: Colors.redAccent, fontSize: 25),
            )
          ],
        ));
  }
}

// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
//          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _goodsItem2(),
            _goodsItem2(),
          ],
        ),
        Column(
          children: <Widget>[
            _goodsItem(),
            _goodsItem(),
            _goodsItem(),
          ],
        ),
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem2(),
        _goodsItem2(),
      ],
    );
  }

  Widget _goodsItem() {
    return Container(
      margin: EdgeInsets.all(1.0),
      width: ScreenUtil().setWidth(370),
      height: ScreenUtil().setHeight(445),
      child: InkWell(
        onTap: () {
          print("点击了楼层商品");
        },
        child: Image.asset(
          Utils.getImgPath("banner_test3"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _goodsItem2() {
    return Container(
      margin: EdgeInsets.all(1.0),
      width: ScreenUtil().setWidth(370),
      height: ScreenUtil().setHeight(670),
      child: InkWell(
        onTap: () {
          print("点击了楼层商品");
        },
        child: Image.asset(
          Utils.getImgPath("banner_test1"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// 火爆专区
class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  void initState() {
    super.initState();
    request("homePageBelowConten", formData: null).then((val) {
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("收费的"),
    );
  }
}
