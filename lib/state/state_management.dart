import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/models/product_size.dart';
import 'package:shoppingapp/models/sub-categories.dart';

final subCateSelected = StateProvider((ref) => SubCategory());
final productSelected = StateProvider((ref) => Product());
final productSizeSelected = StateProvider((ref) => ProductSizes());