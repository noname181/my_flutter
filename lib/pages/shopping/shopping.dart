import 'package:first_flutter_app/pages/shopping/category.dart';
import 'package:first_flutter_app/pages/shopping/top_slider.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late Future sliders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopSlider(),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Danh mục sản phẩm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Tất cả (4)',
              ),
            ],
          ),
        ),
        const CategorySlide(),
      ],
    );
  }
}
