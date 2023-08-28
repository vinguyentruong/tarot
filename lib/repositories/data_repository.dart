import 'package:injectable/injectable.dart';
import 'package:tarot/data/app_singleton.dart';
import 'package:tarot/data/remote/data_service.dart';

import '../common/api_client/data_state.dart';
import '../data/remote/responses/card_response.dart';
import '../entities/card.dart';
import '../entities/category.dart';
import '../entities/post.dart';

abstract class DataRepository {
  Future<DataState<List<Card>>> getCards();

  Future<DataState<List<Category>>> getCategories();

  Future<DataState<CardResponse>> getCardDetail(String id);

  Future<DataState<List<Post>>> getPost({required String cardId, required String categoryKey});
}

@LazySingleton(as: DataRepository)
class DataRepositoryImplement extends DataRepository {
  DataRepositoryImplement(this._dataService);

  final DataService _dataService;

  @override
  Future<DataState<CardResponse>> getCardDetail(String id) {
    return _dataService.getCardDetail(id);
  }

  @override
  Future<DataState<List<Card>>> getCards() async {
    final result = await _dataService.getCards();
    if (result.isSuccess()) {
      AppSingleton.instance.cards = result.data;
    }
    return result;
  }

  @override
  Future<DataState<List<Category>>> getCategories() async {
    final result = await _dataService.getCategories();
    if (result.isSuccess()) {
      AppSingleton.instance.categories = result.data;
    }
    return result;
  }

  @override
  Future<DataState<List<Post>>> getPost({required String cardId, required String categoryKey}) {
    return _dataService.getPost(cardId: cardId, categoryKey: categoryKey);
  }
}
