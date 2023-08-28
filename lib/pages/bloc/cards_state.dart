import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/category.dart';

import '../../entities/card.dart';

class CardsState {
  List<Card>? cards;
  RequestStatus requestStatus;

  CardsState({
    this.cards,
    this.requestStatus = RequestStatus.initial,
  });

  CardsState copyWith({
    List<Card>? cards,
    RequestStatus? requestStatus,
  }) {
    return CardsState(
      cards: cards ?? this.cards,
      requestStatus: requestStatus ?? RequestStatus.initial,
    );
  }
}
