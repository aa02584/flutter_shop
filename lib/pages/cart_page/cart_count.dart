import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  var item;
  int index;

  CartCount(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(context),
          _addBtn(context),
        ],
      ),
    );
  }

  Widget _reduceBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context)
            .addOrReduceAction(item, "reduce", index);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : Colors.black12,
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(item.count > 1 ? "-" : " "),
      ),
    );
  }

  Widget _addBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context)
            .addOrReduceAction(item, "add", index);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text("+"),
      ),
    );
  }

  // 中间数量显示区域
  Widget _countArea(context) {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text("${item.count}"),
    );
  }
}