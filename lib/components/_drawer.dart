import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingapp/models/category.dart';
import 'package:shoppingapp/networking/api_request.dart';
import 'package:shoppingapp/state/state_management.dart';

class MyDrawer extends ConsumerWidget {
  // ignore: top_level_function_literal_block
  final _fetchCategories = FutureProvider((ref) async {
    return await fetchCategories();
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var categoriesImgApiResult = watch(_fetchCategories);
    return Drawer(
      child: categoriesImgApiResult.when(
          data: (categories) => ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ExpansionTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(categories[i].categoryImg),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          categories[i].categoryName!.length <= 10
                              ? Text("${categories[i].categoryName}")
                              : Text(
                                  "${categories[i].categoryName}",
                                  style: TextStyle(fontSize: 12),
                                )
                        ],
                      ),
                      children: _buildList(categories[i], context),
                    ),
                  ),
                );
              }),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          error: (error,context) => Center(
                child: Text("$error"),
              )),
    );
  }

  List<Widget> _buildList(MyCategory category, BuildContext context) {
    List<Widget> list = <Widget>[];
    category.subCategories!.forEach((e) {
      list.add(GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Flexible(
              child: Text(
            "${e.subCategoryName}",
            overflow: TextOverflow.ellipsis,
          )),
        ),
        onTap: () {
          context.read(subCateSelected).state = e;
          Navigator.of(context).pushNamed('/productList');
        },
      ));
    });
    return list;
  }
}
