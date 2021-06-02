import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/models/product_size.dart';
import 'package:shoppingapp/state/state_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeWidget extends StatelessWidget {
  final SizeModel sizeModel;
  final ProductSizes productSizes;

  SizeWidget(this.sizeModel, this.productSizes);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          sizeModel.productSizes.mySize!.sizeName,
          style: TextStyle(
            color:sizeModel.productSizes.number == 0 ? Colors.grey : sizeModel.isSelected ? Colors.white : Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: sizeModel.productSizes.number == 0 ? Colors.grey : sizeModel.isSelected ? Colors.black : Colors.transparent,
        border: Border.all(
            width: 1.0,
            color: sizeModel.isSelected ? Colors.black:Colors.grey,
        ),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0))
      ),
    );
  }
}

class SizeModel {
  bool isSelected;
  final ProductSizes productSizes;

  SizeModel({required this.isSelected, required this.productSizes});
}
