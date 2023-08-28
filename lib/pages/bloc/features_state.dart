import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/category.dart';

import '../../entities/card.dart';

class FeaturesState {
  List<Category>? categories;
  List<Card>? cards;
  RequestStatus requestStatus;

  FeaturesState({
    this.categories,
    this.cards,
    this.requestStatus = RequestStatus.initial,
  });

  FeaturesState copyWith({
    List<Category>? categories,
    List<Card>? cards,
    RequestStatus? requestStatus,
  }) {
    return FeaturesState(
      categories: categories ?? this.categories,
      cards: cards ?? this.cards,
      requestStatus: requestStatus ?? RequestStatus.initial,
    );
  }
}
