import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarot/common/api_client/data_state.dart';
import 'package:tarot/data/remote/responses/card_response.dart';
import 'package:tarot/data/remote/responses/category_response.dart';

import '../../common/api_client/api_client.dart';
import '../../common/api_client/api_response.dart';
import 'api_endpoint.dart';
import 'responses/post_response.dart';

abstract class DataService {
  Future<DataState<List<CardResponse>>> getCards();

  Future<DataState<List<CategoryResponse>>> getCategories();

  Future<DataState<CardResponse>> getCardDetail(String id);

  Future<DataState<List<PostResponse>>> getPost(
      {required String cardId, required String categoryKey});
}

@LazySingleton(as: DataService)
class DataServiceImplement extends DataService {
  DataServiceImplement(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<DataState<CardResponse>> getCardDetail(String id) async {
    try {
      final ApiResponse response = await _apiClient.get(path: ApiEndpoint.cardDetail + '/$id');
      if (response.isSuccess()) {
        return DataSuccess<CardResponse>(CardResponse.fromJson(response.data));
      }
      return DataFailed<CardResponse>(response.message ?? '');
    } on DioError catch (e) {
      return DataFailed<CardResponse>(e.message);
    } on Exception catch (e) {
      return DataFailed<CardResponse>(e.toString());
    }
  }

  @override
  Future<DataState<List<CardResponse>>> getCards() async {
    try {
      final ApiResponse response = await _apiClient.get(path: ApiEndpoint.allCard);
      if (response.isSuccess()) {
        return DataSuccess<List<CardResponse>>((response.data['items'] as List<dynamic>)
            .map((e) => CardResponse.fromJson(e))
            .toList());
      }
      return DataFailed<List<CardResponse>>(response.message ?? '');
    } on DioError catch (e) {
      return DataFailed<List<CardResponse>>(e.message);
    } on Exception catch (e) {
      return DataFailed<List<CardResponse>>(e.toString());
    }
  }

  @override
  Future<DataState<List<CategoryResponse>>> getCategories() async {
    try {
      final ApiResponse response = await _apiClient.get(path: ApiEndpoint.allCategories);
      if (response.isSuccess()) {
        return DataSuccess<List<CategoryResponse>>((response.data['items'] as List<dynamic>)
            .map((e) => CategoryResponse.fromJson(e))
            .toList());
      }
      return DataFailed<List<CategoryResponse>>(response.message ?? '');
    } on DioError catch (e) {
      return DataFailed<List<CategoryResponse>>(e.message);
    } on Exception catch (e) {
      return DataFailed<List<CategoryResponse>>(e.toString());
    }
  }

  @override
  Future<DataState<List<PostResponse>>> getPost(
      {required String cardId, required String categoryKey}) async {
    try {
      final ApiResponse response =
          await _apiClient.get(path: ApiEndpoint.getPost, queryParameters: {
        'card_id': cardId,
        'key': categoryKey,
      });
      if (response.isSuccess()) {
        return DataSuccess<List<PostResponse>>((response.data['items'] as List<dynamic>)
            .map((e) => PostResponse.fromJson(e))
            .toList());
      }
      return DataFailed<List<PostResponse>>(response.message ?? '');
    } on DioError catch (e) {
      return DataFailed<List<PostResponse>>(e.message);
    } on Exception catch (e) {
      return DataFailed<List<PostResponse>>(e.toString());
    }
  }
}
