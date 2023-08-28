import 'package:tarot/entities/card.dart';
import 'package:tarot/entities/category.dart';

class AppSingleton {
  factory AppSingleton() {
    return _singleton;
  }

  AppSingleton._internal();

  static AppSingleton get instance => AppSingleton();

  static final AppSingleton _singleton = AppSingleton._internal();

  List<Category>? categories;

  List<Card>? cards;
}
