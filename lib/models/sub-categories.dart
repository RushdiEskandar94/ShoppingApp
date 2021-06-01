class SubCategory {
  int? subCategoryId;
  String? subCategoryName = "";
  int? categoryId;
  //List<Null> products;

  SubCategory(
      {this.subCategoryId,
       this.subCategoryName,
       this.categoryId,
      });

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['subCategoryId'];
    subCategoryName = json['subCategoryName'];
    categoryId = json['categoryId'];
    // if (json['products'] != null) {
    //   products = List.empty();
    //   json['products'].forEach((v) {
    //     products.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoryId'] = this.subCategoryId;
    data['subCategoryName'] = this.subCategoryName;
    data['categoryId'] = this.categoryId;
    // if (this.products != null) {
    //   data['products'] = this.products.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}