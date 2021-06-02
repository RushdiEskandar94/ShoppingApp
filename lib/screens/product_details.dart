import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingapp/components/_drawer.dart';
import 'package:shoppingapp/components/size_widget.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/models/product_size.dart';
import 'package:shoppingapp/networking/api_request.dart';
import 'package:shoppingapp/state/state_management.dart';

class ProductDetails extends ConsumerWidget {
  final fetchProductDetails =
      FutureProvider.family<Product, int>((ref, productId) async {
    return await fetchProductById(productId);
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var productDetailsApiResult = watch(fetchProductDetails(
        context.read(productSelected).state!.productId as int));
    var _productSizeSelected = watch(productSizeSelected).state; // listen to change to re-render
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: productDetailsApiResult.when(
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (error, context) => Text("$error"),
              data: (product) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                                items: product.productImages!
                                    .map((e) => Builder(builder: (context) {
                                          return Container(
                                            child: Image.network(
                                              e.imgUrl as String,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }))
                                    .toList(),
                                options: CarouselOptions(
                                    initialPage: 0,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    height: MediaQuery.of(context).size.height /
                                        3 *
                                        2.5))
                          ],
                        ),
                        // name of product
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Flexible(
                              child: Text(
                            "${product.productName}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                        ),
                        // price of product
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
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
                                        decoration:
                                            TextDecoration.lineThrough)),
                                TextSpan(
                                    text: '\$${product.productNewPrice}',
                                    style: TextStyle(fontSize: 18))
                              ]))
                            ],
                          ),
                        ),
                        // short product description
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${product.productShortDescription}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        // Sizes
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "size",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.justify,
                            )),
                        product.productSizes != null
                            ? Wrap(
                                children:
                                    (product.productSizes as List<ProductSizes>)
                                        .map((size) => GestureDetector(
                                              onTap: size.number! > 0 ? () {
                                                 // if product sizes number > 0
                                                context.read(productSizeSelected).state = size;
                                              }:null,
                                              child: SizeWidget(
                                                  SizeModel(
                                                      isSelected: _productSizeSelected.mySize == size.mySize,
                                                      productSizes: size),
                                                  size),
                                            ))
                                        .toList(),
                              )
                            : Container(),
                        // text warning
                        // button add to bag
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: () {},
                                child: const Text('Add to Bag'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey)),
                                      child: const Text("Add to Wish List"),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey)),
                                      child: const Text("Notify Me"),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        // product further details
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Further details",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.justify,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${product.productDescription}",
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
