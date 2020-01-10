import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryBidModel> childCategoryList = [];

  getGoodsList(List list) {
    childCategoryList = list;
    notifyListeners();
  }
}
