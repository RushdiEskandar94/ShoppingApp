class Product {
  int? productId;
  String productName = "";
  String productShortDescription= "";
  String productDescription= "";
  double? productOldPrice;
  double? productNewPrice;
  bool? productIsSale;
  Null productSaleText;
  String? productSubText;
  int? productOrderNumber;
  String? productCreateDate;
  String? productCode;
  int? subCategoryId;
  // Null subCategory;
  // List<Null> productColours;
  // List<Null> productFabrics;
  List<ProductImages>? productImages;
  // List<Null> productJacketModels;
  // List<Null> productPatterns;
  // List<Null> productSizes;

  Product(
      { required this.productId,
        required this.productName,
        required this.productShortDescription,
        required this.productDescription,
        required this.productOldPrice,
        required this.productNewPrice,
        required this.productIsSale,
        required this.productSaleText,
        required this.productSubText,
        required this.productOrderNumber,
        required this.productCreateDate,
        required this.productCode,
        required this.subCategoryId,
        // required this.subCategory,
        // required this.productColours,
        // required this.productFabrics,
        required this.productImages,
        // required this.productJacketModels,
        // required this.productPatterns,
        // required this.productSizes
     });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productShortDescription = json['productShortDescription'];
    productDescription = json['productDescription'];
    productOldPrice = json['productOldPrice'];
    productNewPrice = json['productNewPrice'];
    productIsSale = json['productIsSale'];
    productSaleText = json['productSaleText'];
    productSubText = json['productSubText'];
    productOrderNumber = json['productOrderNumber'];
    productCreateDate = json['productCreateDate'];
    productCode = json['productCode'];
    subCategoryId = json['subCategoryId'];
    // subCategory = json['subCategory'];
    // if (json['productColours'] != null) {
    //   productColours = <Null>[];
    //   json['productColours'].forEach((v) {
    //     productColours.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['productFabrics'] != null) {
    //   productFabrics = <Null>[];
    //   json['productFabrics'].forEach((v) {
    //     productFabrics.add(new Null.fromJson(v));
    //   });
    // }
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
    // if (json['productJacketModels'] != null) {
    //   productJacketModels = <Null>[];
    //   json['productJacketModels'].forEach((v) {
    //     productJacketModels.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['productPatterns'] != null) {
    //   productPatterns = <Null>[];
    //   json['productPatterns'].forEach((v) {
    //     productPatterns.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['productSizes'] != null) {
    //   productSizes = <Null>[];
    //   json['productSizes'].forEach((v) {
    //     productSizes.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId as int;
    data['productName'] = this.productName;
    data['productShortDescription'] = this.productShortDescription;
    data['productDescription'] = this.productDescription;
    data['productOldPrice'] = this.productOldPrice as double;
    data['productNewPrice'] = this.productNewPrice as double;
    data['productIsSale'] = this.productIsSale;
    data['productSaleText'] = this.productSaleText;
    data['productSubText'] = this.productSubText;
    data['productOrderNumber'] = this.productOrderNumber as int;
    data['productCreateDate'] = this.productCreateDate;
    data['productCode'] = this.productCode;
    data['subCategoryId'] = this.subCategoryId as int;
    // data['subCategory'] = this.subCategory;
    // if (this.productColours != null) {
    //   data['productColours'] =
    //       this.productColours.map((v) => v.toJson()).toList();
    // }
    // if (this.productFabrics != null) {
    //   data['productFabrics'] =
    //       this.productFabrics.map((v) => v.toJson()).toList();
    // }
    if (this.productImages != null) {
      data['productImages'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    // if (this.productJacketModels != null) {
    //   data['productJacketModels'] =
    //       this.productJacketModels.map((v) => v.toJson()).toList();
    // }
    // if (this.productPatterns != null) {
    //   data['productPatterns'] =
    //       this.productPatterns.map((v) => v.toJson()).toList();
    // }
    // if (this.productSizes != null) {
    //   data['productSizes'] = this.productSizes.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ProductImages {
  int? imgId;
  String? imgUrl = "";
  int? productId;

  ProductImages({required this.imgId,required this.imgUrl,required this.productId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    imgId = json['imgId'];
    imgUrl = json['imgUrl'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgId'] = this.imgId;
    data['imgUrl'] = this.imgUrl;
    data['productId'] = this.productId;
    return data;
  }
}