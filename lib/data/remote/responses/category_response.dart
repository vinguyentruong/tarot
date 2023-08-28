import 'package:tarot/entities/category.dart';

class CategoryResponse extends Category {
  CategoryResponse({
    String? id,
    String? name,
    String? key,
  }) : super(
          id: id,
          name: name,
          key: CategoryKeyX.initFrom(key),
        );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json['id'],
      name: json['name'],
      key: json['key'],
    );
  }
}
