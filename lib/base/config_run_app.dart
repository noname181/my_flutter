import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/firebase_options.dart';
import 'package:first_flutter_app/pages/authentication/login.dart';
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
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class AppConfig {
  AppConfig._();

  static Future<void> configRunApp() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    FlutterNativeSplash.remove();
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CategorySliderProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: dColorMain),
        debugShowCheckedModeBanner: false,
        initialRoute: auth.currentUser == null ? '/login' : '/',
        routes: {
          '/': (_) => const MyApp(),
          '/login': (_) => const Login(),
          '/category': (_) => const CategoryPage(),
          '/product': (_) => const ProductPage(),
          '/favourite': (_) => const FavouriteBody(),
          '/seen': (_) => const SeenBody(),
        },
      ),
    ));
  }
}
