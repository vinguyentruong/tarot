// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../common/api_client/api_client.dart' as _i7;
import '../configs/build_config.dart' as _i3;
import '../data/local/keychain/shared_prefs.dart' as _i6;
import '../data/remote/data_service.dart' as _i8;
import '../pages/bloc/card_detail_cubit.dart' as _i12;
import '../pages/bloc/cards_cubit.dart' as _i13;
import '../pages/bloc/features_cubit.dart' as _i10;
import '../pages/bloc/random_cards_cubit.dart' as _i11;
import '../repositories/data_repository.dart' as _i9;
import 'modules.dart' as _i14;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.BuildConfig>(
    () => _i3.BuildConfigProd(),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dio);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => injectableModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.SharedPrefs>(
      () => _i6.SharedPrefs(get<_i5.SharedPreferences>()));
  gh.singleton<_i7.ApiClient>(_i7.ApiClient(dio: get<_i4.Dio>()));
  gh.lazySingleton<_i8.DataService>(
      () => _i8.DataServiceImplement(get<_i7.ApiClient>()));
  gh.lazySingleton<_i9.DataRepository>(
      () => _i9.DataRepositoryImplement(get<_i8.DataService>()));
  gh.factory<_i10.FeaturesCubit>(
      () => _i10.FeaturesCubit(get<_i9.DataRepository>()));
  gh.factory<_i11.RandomCardsCubit>(
      () => _i11.RandomCardsCubit(get<_i9.DataRepository>()));
  gh.factory<_i12.CardDetailCubit>(
      () => _i12.CardDetailCubit(get<_i9.DataRepository>()));
  gh.factory<_i13.CardsCubit>(() => _i13.CardsCubit(get<_i9.DataRepository>()));
  return get;
}

class _$InjectableModule extends _i14.InjectableModule {}
