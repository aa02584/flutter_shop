import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryBidModel> childCategoryList = [];

  int childIndex = 0; //子类索引值
  int categoryIndex = 0; //大类索引
  String categoryId = '4'; //大类ID
  String subId = ''; //小类ID

  getChildCategory(List list) {
    childCategoryList = list;
    notifyListeners();
  }

  //首页点击类别是更改类别
  changeCategory(String id, int index) {
    categoryId = id;
    categoryIndex = index;
    subId = '';
    notifyListeners();
  }
}
