import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/models/product.dart';
import 'package:first_flutter_app/pages/home/widgets/category_body.dart';
import 'package:first_flutter_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(data['categoryId']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        title: Text(data['title']),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/product', arguments: {
                    "title": products[index].title.toString(),
                    "id": products[index].id
                  });
                },
                child: ChangeNotifierProvider<Product>.value(
                  value: products[index],
                  child: const CategoryBody(),
                )),
          );
        },
      ),
    );
  }
}
