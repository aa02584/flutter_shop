class CategoryBidModel {
//  "mallCategoryId": "4",
//  "mallCategoryName": "白酒",
//  "bxMallSubDto": [{
//  "mallSubId": "2c9f6c94621970a801626a35cb4d0175",
//  "mallCategoryId": "4",
//  "mallSubName": "名酒",
//  "comments": ""
  String mallCategoryId;
  String mallCategoryName;
  List<dynamic> bxMallSubDto;
  Null comments;
  String image;

  CategoryBidModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image,
  });

  factory CategoryBidModel.formJson(dynamic json) {
    return CategoryBidModel(
      mallCategoryId: json["mallCategoryId"],
      mallCategoryName: json["mallCategoryName"],
      bxMallSubDto: json["bxMallSubDto"],
      comments: json["comments"],
      image: json["image"],
    );
  }
}

class CategoryBigListModel {
  List<CategoryBidModel> data;

  CategoryBigListModel(this.data);

  factory CategoryBigListModel.formJson(List json) {
    return CategoryBigListModel(
      json.map((i) => CategoryBidModel.formJson(i)).toList(),
    );
  }
}
