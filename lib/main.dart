import 'package:coin_repository/coin_repository.dart';
import 'package:crypto_converter/app.dart';
import 'package:crypto_converter/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  FlutterServicesBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(App(coinRepository: CoinRepository())),
    blocObserver: Observer(),
    storage: storage,
  );
}
