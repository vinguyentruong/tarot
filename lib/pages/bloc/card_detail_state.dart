import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/card.dart';

class CardDetailState {
  RequestStatus requestStatus;
  Card? card;

  CardDetailState({
    this.requestStatus = RequestStatus.initial,
    this.card,
  });

  CardDetailState copyWith({
    RequestStatus? requestStatus,
    Card? card,
  }) {
    return CardDetailState(
      requestStatus: requestStatus ?? RequestStatus.initial,
      card: card ?? this.card,
    );
  }
}
