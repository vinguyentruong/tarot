import 'package:collection/collection.dart';
import 'package:tarot/common/resources/asset_images.dart';

class Category {
  String? id;
  String? name;
  CategoryKey? key;

  Category({
    this.id,
    this.name,
    this.key,
  });
}

enum CategoryKey {
  daily('daily-tarot'),
  reading('tarot-reading'),
  yesOrNo('yes-or-no'),
  monthly('monthly-tarot'),
  loveAndRelationship('love-and-relationship'),
  health('health'),
  familyAndFriend('family-and-friend'),
  dreamAndAmbition('dream-and-ambition'),
  life('life'),
  pastLife('past-life'),
  money('money'),
  success('success'),
  luck('luck'),
  work('work-career');

  const CategoryKey(this.rawValue);
  final String rawValue;
}

extension CategoryKeyX on CategoryKey {
  static CategoryKey? initFrom(String? value) {
    return CategoryKey.values.firstWhereOrNull((CategoryKey e) => e.rawValue == value);
  }

  String get image {
    switch (this) {
      case CategoryKey.daily:
        return AssetImages.icOneTarot;
      case CategoryKey.reading:
        return AssetImages.icMoreTarot;
      case CategoryKey.yesOrNo:
        return AssetImages.icMoreTarot;
      case CategoryKey.monthly:
        return AssetImages.icCrescentMoon;
      case CategoryKey.loveAndRelationship:
        return AssetImages.icTarotFun;
      case CategoryKey.health:
        return AssetImages.icCrescentMoon;
      case CategoryKey.familyAndFriend:
        return AssetImages.icTarotFun;
      case CategoryKey.dreamAndAmbition:
        return AssetImages.icCrescentMoon;
      case CategoryKey.life:
        return AssetImages.icTarotFun;
      case CategoryKey.pastLife:
        return AssetImages.icCrescentMoon;
      case CategoryKey.money:
        return AssetImages.icTarotFun;
      case CategoryKey.success:
        return AssetImages.icTarotFun;
      case CategoryKey.luck:
        return AssetImages.icTarotFun;
      case CategoryKey.work:
        return AssetImages.icOneTarot;
    }
  }

  bool get isHomeTab {
    switch (this) {
      case CategoryKey.reading:
      case CategoryKey.monthly:
      case CategoryKey.daily:
      case CategoryKey.yesOrNo:
        return true;
      default:
        return false;
    }
  }
}