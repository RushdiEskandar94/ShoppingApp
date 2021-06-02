import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/state/state_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 12,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  product.productImages![0].imgUrl as String,
                  fit: BoxFit.cover,
                ),
                product.productIsSale == true
                    ? Column(
                        children: [
                          Container(
                            color: Color(0xDD333639),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                product.productSaleText as String,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "${product.productName}",
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  product.productSubText == null
                      ? Container()
                      : Text("${product.productSubText}"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: product.productOldPrice == 0
                                ? ''
                                : '\$${product.productOldPrice}',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                        TextSpan(text: '\$${product.productNewPrice}',style: TextStyle(fontSize: 18))
                      ]))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        context.read(productSelected).state = product;
        Navigator.of(context).pushNamed('/productDetails');
      },
    );
  }
}
