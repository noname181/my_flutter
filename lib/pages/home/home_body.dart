import 'package:first_flutter_app/config/const.dart';
import 'package:first_flutter_app/providers/category_provider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var categoryItem = snapshot.hasData ? snapshot.data : [];
          return snapshot.hasData
              ? GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categoryItem?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => CategoryPage(title: index)));
                        Navigator.pushNamed(context, '/category', arguments: {
                          "title": categoryItem[index].name,
                          "categoryId": categoryItem[index].id,
                        });
                      },
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        categoryItem![index].image,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  categoryItem[index].name.toString(),
                                  style: styleTitleItem,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Empty'),
                );
        }
      },
    );
  }
}
