import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/category.dart';
import 'package:tarot/entities/post.dart';

import '../../entities/card.dart';

class RandomCardsState {
  List<Card>? cards;
  Category? category;
  List<List<Post>?>? posts;
  RequestStatus requestStatus;
  List<Card>? cardDraws;

  RandomCardsState({
    this.cards,
    this.category,
    this.posts,
    this.cardDraws,
    this.requestStatus = RequestStatus.initial,
  });

  RandomCardsState copyWith({
    List<Card>? cards,
    Category? category,
    List<List<Post>?>? posts,
    RequestStatus? requestStatus,
    List<Card>? cardDraws,
  }) {
    return RandomCardsState(
      cards: cards ?? this.cards,
      category: category ?? this.category,
      posts: posts ?? this.posts,
      requestStatus: requestStatus ?? RequestStatus.initial,
      cardDraws: cardDraws ?? this.cardDraws,
    );
  }
}
