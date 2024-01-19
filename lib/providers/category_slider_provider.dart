import 'dart:convert';

import 'package:first_flutter_app/models/category_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategorySliderProvider extends ChangeNotifier {
  Future<List<CategorySlider>> getSlider() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);

      List<CategorySlider> data = List<CategorySlider>.from(jsonData.map(
          (slider) => CategorySlider.fromJson(jsonEncode(slider)))).toList();
      return data;
    } catch (e) {
      return Future.error(Exception('Nodata'));
    }
  }
}
