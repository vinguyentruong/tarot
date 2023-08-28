import 'package:tarot/entities/post.dart';

import '../../../entities/category.dart';

class PostResponse extends Post {
  PostResponse({
    String? id,
    String? cardId,
    String? categoryId,
    String? content,
    String? type,
    String? categoryKey,
  }) : super(
          id: id,
          cardId: cardId,
          categoryId: categoryId,
          content: content,
          type: PostTypeX.initFrom(type),
          rawType: type,
          categoryKey: CategoryKeyX.initFrom(categoryKey),
        );

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      id: json['id'],
      cardId: json['card_id'],
      categoryId: json['category_id'],
      categoryKey: json['category_key'],
      type: json['type'],
      content: json['content'],
    );
  }
}
