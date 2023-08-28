import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarot/common/api_client/data_state.dart';
import 'package:tarot/common/enums/request_status.dart';
import 'package:tarot/entities/category.dart';
import 'package:tarot/pages/bloc/features_state.dart';
import 'package:tarot/repositories/data_repository.dart';

@injectable
class FeaturesCubit extends Cubit<FeaturesState> {
  FeaturesCubit(this._dataRepository) : super(FeaturesState());

  final DataRepository _dataRepository;

  Future<void> initData() async {
    emit(state.copyWith(requestStatus: RequestStatus.requesting));
    await _fetchCards();
    await _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final result = await _dataRepository.getCategories();
      if (result.isSuccess()) {
        final List<Category> categories = List.from(result.data ?? []);
        categories.add(Category(key: CategoryKey.daily, name: 'Weekly Tarot'));
        emit(state.copyWith(
          requestStatus: RequestStatus.success,
          categories: categories,
        ));
      } else {
        emit(state.copyWith(requestStatus: RequestStatus.failed));
      }
    } catch (e) {
      emit(state.copyWith(requestStatus: RequestStatus.failed));
      print(e.toString());
    }
  }

  Future<void> _fetchCards() async {
    try {
      final result = await _dataRepository.getCards();
      if (result.isSuccess()) {
        emit(
          state.copyWith(cards: result.data),
        );
      } else {
        // emit(state.copyWith(requestStatus: RequestStatus.failed));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
