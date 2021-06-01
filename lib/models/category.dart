import 'package:shoppingapp/models/sub-categories.dart';

class MyCategory {
  int? categoryId;
  String? categoryName = "";
  String categoryImg = "";
  List<SubCategory>? subCategories = <SubCategory>[];

  MyCategory(
      { this.categoryId,
        this.categoryName,
        required this.categoryImg,
        this.subCategories});

  MyCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    if (json['subCategories'] != null) {
      json['subCategories'].forEach((v) {
        subCategories!.add(SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['categoryImg'] = this.categoryImg;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

