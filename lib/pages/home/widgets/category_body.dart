import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 200,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: dColorFooterImage,
          title: Text(
            product.title,
            style: styleTitleItem,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Product>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          value.toggleIsFavourite();
                        },
                        child: Icon(
                          Icons.favorite,
                          color: product.isFavourite
                              ? dColorIconButtonActive
                              : dColorIconButtonInactive,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        value.favorite,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.timelapse_sharp,
                color: dColorMain,
              ),
              const SizedBox(width: 10),
              Text(
                product.view,
                style: styleTitleItem,
              )
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
