import 'package:shoppingapp/models/size.dart';

class ProductSizes {
  int? sizeId;
  int? productId;
  int? number;
  MySize? mySize;

  ProductSizes({this.sizeId, this.productId,this.number, this.mySize});

  ProductSizes.fromJson(Map<String, dynamic> json) {
    sizeId = json['sizeId'];
    productId = json['productId'];
    number = json['number'];
    mySize = (json['size'] != null ? new MySize.fromJson(json['size']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizeId'] = this.sizeId;
    data['productId'] = this.productId;
    data['number'] = this.number;
    if (this.mySize != null) {
      data['size'] = this.mySize!.toJson();
    }
    return data;
  }
}