import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/pages/favourite/favourite_body.dart';
import 'package:first_flutter_app/pages/home/widgets/category.dart';
import 'package:first_flutter_app/pages/home/widgets/product.dart';
import 'package:first_flutter_app/pages/index.dart';
import 'package:first_flutter_app/pages/seen/seen_body.dart';
import 'package:first_flutter_app/providers/category_provider.dart';
import 'package:first_flutter_app/providers/category_slider_provider.dart';
import 'package:first_flutter_app/providers/product_provider.dart';
import 'package:first_flutter_app/providers/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => SliderProvider()),
      ChangeNotifierProvider(create: (_) => CategorySliderProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(primaryColor: dColorMain),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MyApp(),
        '/category': (_) => const CategoryPage(),
        '/product': (_) => const ProductPage(),
        '/favourite': (_) => const FavouriteBody(),
        '/seen': (_) => const SeenBody(),
      },
    ),
  ));
}
