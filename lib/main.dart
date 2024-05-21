import 'package:coin_repository/coin_repository.dart';
import 'package:crypto_converter/app.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presenter/core/core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final observer = Observer();
  final coinRepository = CoinRepository();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      App(
        coinRepository: coinRepository,
      ),
    ),
    blocObserver: observer,
    storage: storage,
  );
}
