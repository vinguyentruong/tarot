import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'configs/build_config.dart';
import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.dev,
  );
  await configureDependencies(environment);
  final BuildConfig buildConfig = getIt<BuildConfig>();
  if (buildConfig.debugLog) {
    Bloc.observer = AppBlocObserver();
  }
  runApp(MyApp());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
