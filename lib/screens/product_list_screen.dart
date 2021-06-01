import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingapp/components/_drawer.dart';
import 'package:shoppingapp/networking/api_request.dart';
import 'package:shoppingapp/state/state_management.dart';

class ProductListPage extends ConsumerWidget {
  // ignore:top_level_function_literal_block
  // final _fetchProductBySuCateId = FutureProvider((ref) async {
  //   return await fetchProductsBySubCateId(id)
  // });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //var productsBySubCateIdApiResult = watch(_fetchProductBySuCateId);
    return Scaffold(
        key: _scaffoldKey,
        drawer: MyDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 35,
                            color: Colors.black,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.account_circle_outlined,
                                size: 35,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                size: 35,
                                color: Colors.black,
                              ))
                        ],
                      )
                    ],
                  ),
                  Row(children: [
                    Column(children: [
                      Container(
                        color: Colors.amberAccent,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child:
                            Text("${context.read(subCateSelected).state.subCategoryName}"),),
                        ),
                      )
                    ],)
                  ],)

                ],
              )
            ],
          ),
        ));
  }
}
