import 'package:first_flutter_app/providers/category_slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySlide extends StatefulWidget {
  const CategorySlide({super.key});

  @override
  State<CategorySlide> createState() => _CategorySlideState();
}

class _CategorySlideState extends State<CategorySlide> {
  late Future category_sliders;
  @override
  void didChangeDependencies() {
    category_sliders = Provider.of<CategorySliderProvider>(context).getSlider();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: category_sliders,
      initialData: const [],
      builder: (context, snapshot) {
        final data = snapshot.data! as List;
        return Container(
          height: MediaQuery.of(context).size.width * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1, color: Colors.black26),
                  image: DecorationImage(
                    image: NetworkImage(data[index].image),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
