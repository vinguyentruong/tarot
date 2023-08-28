import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarot/common/api_client/data_state.dart';
import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/data/app_singleton.dart';
import 'package:tarot/entities/category.dart';
import 'package:tarot/entities/post.dart';
import 'package:tarot/repositories/data_repository.dart';

import '../../entities/card.dart';
import 'random_cards_state.dart';

@injectable
class RandomCardsCubit extends Cubit<RandomCardsState> {
  RandomCardsCubit(this._dataRepository)
      : super(RandomCardsState(cards: AppSingleton.instance.cards));

  final DataRepository _dataRepository;
  List<Card> _drawedCards = [];

  void initData(Category? category) {
    emit(state.copyWith(category: category));
  }

  void drawMultipleCard(int numbOfCard) {
    int count = 0;
    while (count < numbOfCard) {
      final card = _randomCard();
      if (card != null) {
        _drawedCards.add(card);
      }
      count += 1;
    }
    emit(state.copyWith(cardDraws: _drawedCards));
    _drawCard(numbOfCard);
  }

  void resetDrawedCards() {
    _drawedCards = [];
    emit(state.copyWith(cardDraws: []));
  }

  Future<void> _drawCard(int numOfCards) async {
    try {
      emit(state.copyWith(requestStatus: RequestStatus.requesting));
      final List<List<Post>?> resultPosts = [];
      for (var i = 0; i < numOfCards; i++) {
        final result = await _dataRepository.getPost(
          cardId: _drawedCards[i].id!,
          categoryKey: state.category?.key?.rawValue ?? '',
        );
        if (result.isSuccess()) {
          final posts = result.data;
          posts?.sort((itemA, itemB) {
            return itemA.type == PostType.general
                ? 0
                : itemA.type == PostType.family
                    ? 1
                    : itemA.type == PostType.love
                        ? 2
                        : itemA.type == PostType.work
                            ? 3
                            : 4;
          });
          resultPosts.add(posts);
        } else {
          emit(state.copyWith(requestStatus: RequestStatus.failed));
        }
      }
      emit(state.copyWith(requestStatus: RequestStatus.success, posts: resultPosts));
    } catch (e) {
      emit(state.copyWith(requestStatus: RequestStatus.failed));
      print(e.toString());
    }
  }

  Card? _randomCard() {
    final random = Random();
    Card? card;
    do {
      final randomIndex = random.nextInt(state.cards?.length ?? 0);
      if (!(randomIndex < (state.cards?.length ?? 0))) {
        return null;
      }
      card = state.cards?[randomIndex];
    } while (!(_drawedCards ?? []).any((element) => element.id == card?.id));
    return card;
  }
}
