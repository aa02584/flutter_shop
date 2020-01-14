import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cartinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartInfoMode> cartList = [];
  double allPrice = 0; // 总价格
  int allGoodsCount = 0; // 总数量
  bool isAllCheck = true; //是否全选

  save(goodId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    allGoodsCount = 0;
    allPrice = 0;
    tempList.forEach(
      (item) {
//        if (item["goodsId"] == goodId) {
//          tempList[ival]["count"] = item["count"] + 1;
//          cartList[ival].count++;
//          isHave = true;
//        }
        if (item["isCheck"]) {
          allPrice += (cartList[ival].price * cartList[ival].count);
          allGoodsCount += cartList[ival].count;
        }
        ival++;
      },
    );
//    if (!isHave) {

    Map<String, dynamic> newGoods = {
      "goodsId": goodId,
      "goodsName": goodsName,
      "count": count,
      "price": price,
      "images": images,
      "isCheck": true,
    };
    tempList.add(newGoods);
    cartList.add(CartInfoMode.fromJson(newGoods));
    allPrice += (count * price);
    allGoodsCount += count;

    cartString = json.encode(tempList).toString();
    print(cartString);
    print("数据模型 $cartList");
    prefs.setString("cartInfo", cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cartInfo");
    print("清空完成---------");
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;
      tempList.forEach(
        (item) {
          if (item["isCheck"]) {
            allPrice += (item["count"] * item["price"]);
            allGoodsCount += item["count"];
          } else {
            isAllCheck = false;
          }

          cartList.add(CartInfoMode.fromJson(item));
        },
      );
    }
    notifyListeners();
  }

  // 删除单个商品
  deleteOneGoods(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    tempList.removeAt(index);

    cartString = json.encode(tempList).toString();
    prefs.setString("cartInfo", cartString);

    await getCartInfo();
  }

  // 改变单个checkbox
  changeCheckState(CartInfoMode cartItem, index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    tempList[index] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString("cartInfo", cartString);

    await getCartInfo();
  }

  // 点击全选按钮
  changeAllCheckBtnState(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    for (var value in tempList) {
      var newItem = value;
      newItem["isCheck"] = isCheck;
      newList.add(newItem);
    }

    cartString = json.encode(newList).toString();
    prefs.setString("cartInfo", cartString);
    await getCartInfo();
  }

  // 商品数量加减
  addOrReduceAction(var cartItem, String todo, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");

    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    if (todo == "add") {
      cartItem.count++;
    } else if (cartItem.count > 1) {
      cartItem.count--;
    }
    tempList[index] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCartInfo();
  }
}
