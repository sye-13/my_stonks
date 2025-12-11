import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:my_stonks_flutter/assets_overview/assets_overview.dart';
import 'package:my_stonks_flutter/theme/theme.dart';
import 'package:server/server.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  ClientChannel clientChannel,
  ThemeApi themeApi,
  FutureOr<Widget> Function(AssetsRepository, ThemeRepository) builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final assetsRepository = AssetsRepository(
    assetsServiceClient: AssetsServiceClient(clientChannel),
  );
  final themeRepository = ThemeRepository(api: themeApi);

  runApp(await builder(assetsRepository, themeRepository));
}
