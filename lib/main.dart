import 'package:crypto_converter/app.dart';
import 'package:crypto_converter/core/observer.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const App());
}
