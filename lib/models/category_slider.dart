import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategorySlider {
  int id;
  String name;
  String image;
  CategorySlider({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategorySlider.fromMap(Map<String, dynamic> map) {
    return CategorySlider(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategorySlider.fromJson(String source) =>
      CategorySlider.fromMap(json.decode(source) as Map<String, dynamic>);
}
