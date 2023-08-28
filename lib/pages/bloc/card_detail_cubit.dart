import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarot/common/api_client/data_state.dart';
import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/card.dart';
import 'package:tarot/pages/bloc/card_detail_state.dart';
import 'package:tarot/repositories/data_repository.dart';

@injectable
class CardDetailCubit extends Cubit<CardDetailState> {

  CardDetailCubit(this._dataRepository) : super(CardDetailState());

  final DataRepository _dataRepository;

  void initData(Card? card) {
    emit(state.copyWith(card: card));
    fetchCard(card?.id);
  }

  Future<void> fetchCard(String? cardId) async {
    if (cardId == null) {
      return;
    }
    try {
      emit(state.copyWith(requestStatus: RequestStatus.requesting));
      final result = await _dataRepository.getCardDetail(cardId);
      if (result.isSuccess()) {
        emit(state.copyWith(requestStatus: RequestStatus.success, card: result.data));
      } else {
        emit(state.copyWith(requestStatus: RequestStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(requestStatus: RequestStatus.failed));
      print(e.toString());
    }
  }
}