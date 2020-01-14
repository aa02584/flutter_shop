class CartInfoMode {
  String goodsId;
  String goodsName;
  int count;
  String price;
  String images;

  CartInfoMode(
      this.goodsId, this.goodsName, this.count, this.price, this.images);

  CartInfoMode.fromJson(Map<String, dynamic> json) {
    goodsId = json["goodsId"];
    goodsName = json["goodsName"];
    count = json["count"];
    price = json["price"];
    images = json["images"];
  }
}
