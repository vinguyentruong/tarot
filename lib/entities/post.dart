import 'package:collection/collection.dart';
import 'package:tarot/entities/category.dart';

class Post {
  String? id;
  String? cardId;
  String? categoryId;
  String? content;
  String? rawType;
  PostType? type;
  CategoryKey? categoryKey;

  Post({
    this.id,
    this.cardId,
    this.categoryId,
    this.content,
    this.type,
    this.rawType,
    this.categoryKey,
  });
}

enum PostType {
  general('GENERAL'),
  love('LOVE'),
  family('FAMILY'),
  health('HEALTH'),
  work('WORK'),
  money('MONEY');

  const PostType(this.rawValue);
  final String rawValue;
}

extension PostTypeX on PostType {
  static PostType? initFrom(String? value) {
    return PostType.values.firstWhereOrNull((PostType e) => (value ?? '').contains(e.rawValue));
  }
}