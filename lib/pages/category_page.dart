import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav(),
              CategoryGoodsList(),
            ],
          ),
        ],
      ),
    );
  }
}

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index) {
    bool isClick = (index == listIndex);
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
        var childList = list[index].mallCategoryName;
        // 状态管理
        Provide.value<ChildCategory>(context).getChildCategory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  void _getCategory() async {
    List<CategoryBidModel> navigator = List();

    navigator.add(CategoryBidModel(mallCategoryName: "白酒"));
    navigator.add(CategoryBidModel(mallCategoryName: "家具"));
    navigator.add(CategoryBidModel(mallCategoryName: "蔬菜"));
    navigator.add(CategoryBidModel(mallCategoryName: "电脑"));
    navigator.add(CategoryBidModel(mallCategoryName: "手机"));
    navigator.add(CategoryBidModel(mallCategoryName: "电脑"));
    navigator.add(CategoryBidModel(mallCategoryName: "纸巾"));
    navigator.add(CategoryBidModel(mallCategoryName: "灯"));
    navigator.add(CategoryBidModel(mallCategoryName: "电线"));
    navigator.add(CategoryBidModel(mallCategoryName: "华为"));
    navigator.add(CategoryBidModel(mallCategoryName: "笔记本"));
    navigator.add(CategoryBidModel(mallCategoryName: "打火机"));
    navigator.add(CategoryBidModel(mallCategoryName: "键盘"));
    setState(() {
      list = navigator;
    });
    Provide.value<ChildCategory>(context).getChildCategory(list[0]);
//    await request("_getCategory").then((val) {
//      var data = json.decode(val.toString());
//      CategoryBigListModel category =
//          CategoryBigListModel.formJson(data["data"]);
////      list.data.forEach((item) => print(item.toString()));
//      setState(() {
//        list = category.data;
//      });
//    });
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List list = ["全部", '名酒', '北京二锅头', '宝丰', "茅台", "五粮液", "散白", "啤酒", "可乐"];
  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _rightInkWell(list[index], index);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(String item, int index) {
    bool isClick = (index == listIndex);
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.pink : Colors.black26),
        ),
      ),
    );
  }
}

// 商品列表，实现上拉下拉列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List list = [];

  @override
  void initState() {
    super.initState();
    _getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(570),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _listWidget(index);
          },
        ),
      ),
    );
  }

  void _getGoodsList() async {
    var data = {
      'categoryId': '4',
      'CategorySubId': "",
      "page": 1,
    };

    List listData = List();
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");
    listData.add("dd");

    setState(() {
      list = listData;
    });

//    await request("getMallGoods", formData: data).then((val) {
//      var data = json.decode(val.toString());
//
//    });
  }

  Widget _goodsImage(int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(200),
      child: Image.asset(
        Utils.getImgPath("banner_test1"),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _goodsName(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        "测试商品",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: 40.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            "价格：¥ 87.00",
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Text(
            "¥ 107.00",
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listWidget(int index) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
          msg: "测试Toast",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.pink,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            Column(
              children: <Widget>[
                _goodsName(index),
                _goodsPrice(index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
