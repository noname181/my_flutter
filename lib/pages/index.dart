import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/pages/favourite/favourite_body.dart';
// import 'package:first_flutter_app/pages/home/home_body.dart';
import 'package:first_flutter_app/pages/seen/seen_body.dart';
import 'package:first_flutter_app/pages/shopping/shopping.dart';
import 'package:first_flutter_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Future _dateFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dateFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ShoppingPage(),
    FavouriteBody(),
    SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dateFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text('Good food'),
            ),
            body: _widgetOptions[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timelapse_sharp,
                  ),
                  label: 'Seen',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Theme.of(context).primaryColor,
              iconSize: sizeIconButton,
              unselectedItemColor: dColorIconButtonInactive,
              selectedItemColor: dColorIconButtonActive,
            ),
          );
        }
      },
    );
  }
}
