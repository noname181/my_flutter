import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductProvider>(context).getItemsFavourite();
    return ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Delete Favourite Produc'),
                    content: const Text('Are you sure to delete?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              background: Container(
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
              key: ValueKey<int>(index),
              onDismissed: (DismissDirection direction) {
                items[index].toggleIsFavourite();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Success')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: GridTile(
                    footer: GridTileBar(
                      title: Text(
                        items[index].title,
                        style: styleTitleItem,
                      ),
                      backgroundColor: Colors.white70,
                      trailing: const Icon(
                        Icons.swipe,
                        size: sizeIconButton,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(items[index].image),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
