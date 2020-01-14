import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cartinfo.dart';
import 'package:flutter_shop/pages/cart_page/cart_count.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartItem extends StatelessWidget {
  final CartInfoMode item;
  final int index;

  CartItem(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBt(context, item),
          _cartImage(item),
          _cartGoodsName(item),
          _cartGoodsPrice(context, item),
        ],
      ),
    );
  }

  Widget _cartCheckBt(context, item) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val) {
          item.isCheck = val;
          Provide.value<CartProvide>(context).changeCheckState(item, index);
        },
      ),
    );
  }

  Widget _cartImage(item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Image.asset(item.images),
    );
  }

  Widget _cartGoodsName(item) {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(item,index),
        ],
      ),
    );
  }

  Widget _cartGoodsPrice(context, item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text("¥ ${item.price}"),
          Container(
            child: InkWell(
              onTap: () {
                Provide.value<CartProvide>(context).deleteOneGoods(index);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
