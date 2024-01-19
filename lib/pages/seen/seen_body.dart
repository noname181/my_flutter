import 'package:first_flutter_app/config/const.dart';
import 'package:flutter/material.dart';

class SeenBody extends StatelessWidget {
  const SeenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              background: Container(
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
              key: ValueKey<int>(index),
              onDismissed: (DismissDirection direction) {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: GridTile(
                    footer: const GridTileBar(
                      title: Text(
                        'Djokovic đang ở Paris để dự giải Masters 1000 trong năm',
                        style: styleTitleItem,
                      ),
                      backgroundColor: Colors.white70,
                      trailing: Icon(
                        Icons.swipe,
                        size: sizeIconButton,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
