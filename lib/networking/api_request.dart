
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/const/api_const.dart';
import 'dart:convert';

import 'package:shoppingapp/models/banner.dart';
import 'package:shoppingapp/models/category.dart';
import 'package:shoppingapp/models/feature-image.dart';
import 'package:shoppingapp/models/product.dart';

List<Banner> parseBanner(String responseBody){
  var ls = json.decode(responseBody) as List<dynamic>;
  return ls.map((e) => Banner.fromJson(e)).toList();
}
List<FeatureImg> parseFeatureImg (String responseBody){
  var ls = json.decode(responseBody) as List<dynamic>;
  return ls.map((e) => FeatureImg.fromJson(e)).toList();
}
List<MyCategory> parseCategories(String responseBody){
  // var ls = json.decode(responseBody).cast<Map<String,dynamic>>();
 var ls = json.decode(responseBody) as List<dynamic>;
 return ls.map((e) => MyCategory.fromJson(e)).toList();
}
List<Product> parseProducts(String responseBody){
var ls = json.decode(responseBody) as List<dynamic>;
return ls.map((e) => Product.fromJson(e)).toList();
}

Product parseProduct(String responseBody){
  var product = json.decode(responseBody) as dynamic;
  return Product.fromJson(product);
}

Future<List<Banner>> fetchBanners() async{
 final response = await http.get(Uri.https('$mainUrl', '$bannerUrl'));
  if(response.statusCode == 200){
    return compute(parseBanner,response.body);
  }else if(response.statusCode == 400){
    throw Exception("Banner Not Found");
  }else{
    throw Exception("Can Not Get Banner");
  }
}
Future<List<FeatureImg>> fetchFeatureImages() async{
  final response = await http.get(Uri.https('$mainUrl', '$featureImage'));
  if(response.statusCode == 200){
    return compute(parseFeatureImg,response.body);
  }else if(response.statusCode == 400){
    throw Exception("FeatureImages Not Found");
  }else{
    throw Exception("Can Not Get FeatureImages");
  }
}
Future<List<MyCategory>> fetchCategories() async{
  final response = await http.get(Uri.https('$mainUrl', '$categoryUrl'));
  if(response.statusCode == 200){
    return compute(parseCategories,response.body);
  }else if (response.statusCode == 400){
    throw Exception("Categories not found");
  }else{
    throw Exception("Can Not Get Categories");
  }
}
Future<List<Product>> fetchProductsBySubCateId(id) async{
  final response =await http.get(Uri.https('$mainUrl', "$productsBySubCateIdUrl/$id"));
  if(response.statusCode == 200){
    return compute(parseProducts,response.body);
  }else if (response.statusCode == 400){
    throw Exception("Products By SubCateId not found");
  }else{
    throw Exception("Can Not Get Products By SubCateId");
  }
}

Future<Product> fetchProductById(id) async{
  final response = await http.get(Uri.https('$mainUrl', '$product/$id'));
  if(response.statusCode == 200){
    return compute(parseProduct, response.body);
  }else if (response.statusCode == 400){
    throw Exception("Product By Id not found");
  }else{
    throw Exception("Can Not Get Product By Id");
  }
}