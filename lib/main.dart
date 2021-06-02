import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoppingapp/screens/product_details.dart';
import 'package:shoppingapp/screens/product_list_screen.dart';

import 'networking/api_request.dart';
import 'components/_drawer.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/productList':
            return PageTransition(
                child: ProductListPage(),
                type: PageTransitionType.fade,
                settings: settings);
            break;
          case '/productDetails':
            return PageTransition(
                child: ProductDetails(),
                type: PageTransitionType.fade,
                settings: settings);
            break;
            default:
           return null;
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  // ignore: top_level_function_literal_block
  final _fetchBanners = FutureProvider((ref) async {
    return await fetchBanners();
  });

  // ignore: top_level_function_literal_block
  final _fetchFeatureImages = FutureProvider((ref) async {
    return await fetchFeatureImages();
  });

  // ignore: top_level_function_literal_block
  // final _fetchCategories = FutureProvider((ref) async {
  //   return await fetchCategories();
  // });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var bannerApiResult = watch(_fetchBanners);
    var featureImgApiResult = watch(_fetchFeatureImages);

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: SafeArea(child: Column(
        children: [
          featureImgApiResult.when(
              data: (featureImages) => Stack(
                children: [
                  CarouselSlider(
                    items: featureImages
                        .map((e) => Builder(
                      builder: (context) => Container(
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(e.featureImgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        viewportFraction: 1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () =>
                              _scaffoldKey.currentState!.openDrawer(),
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.navigate_before,
                            color: Colors.white,
                            size: 50,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              loading: () => Center(
                child: const CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(child: Text("$error"))),
          Expanded(
              child: bannerApiResult.when(
                  loading: () =>
                      Center(child: const CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text("$error"),
                  ),
                  data: (banners) => ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: banners.length,
                    itemBuilder: (context, i) => Container(
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image(
                            image: NetworkImage(banners[i].bannerImgUrl),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.5),
                              color: Colors.grey.withOpacity(0.8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                banners[i].bannerText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      ),)
    );
  }
}
