import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_flutter_app/providers/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopSlider extends StatefulWidget {
  const TopSlider({super.key});

  @override
  State<TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  late Future sliders;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    sliders = Provider.of<SliderProvider>(context).getSlider();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder(
        future: sliders,
        initialData: [],
        builder: (context, snapshot) {
          var sliderData = [];
          if (snapshot.hasData) {
            sliderData = snapshot.data! as List;
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
          return CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: sliderData.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(i.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
