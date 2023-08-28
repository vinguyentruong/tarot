import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarot/common/api_client/data_state.dart';
import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/data/app_singleton.dart';
import 'package:tarot/pages/bloc/features_state.dart';
import 'package:tarot/repositories/data_repository.dart';

import 'cards_state.dart';

@injectable
class CardsCubit extends Cubit<CardsState> {
  CardsCubit(this._dataRepository) : super(CardsState(
    cards: AppSingleton.instance.cards
  ));

  final DataRepository _dataRepository;

  void initData() {
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    try {
      final result = await _dataRepository.getCards();
      if (result.isSuccess()) {
        emit(state.copyWith(cards: result.data),);
      } else {
        emit(state.copyWith(requestStatus: RequestStatus.failed));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}