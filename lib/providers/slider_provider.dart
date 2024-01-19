import 'dart:convert';

import 'package:first_flutter_app/models/slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderProvider extends ChangeNotifier {
  Future<List<MySlider>> getSlider() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/sliders';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);

      List<MySlider> data = List<MySlider>.from(
              jsonData.map((slider) => MySlider.fromJson(jsonEncode(slider))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(Exception('Nodata'));
    }
  }
}
