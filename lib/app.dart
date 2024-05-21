import 'package:coin_repository/coin_repository.dart';
import 'package:crypto_converter/presenter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/src/repository_provider.dart';
import 'presenter/converter/converter.dart';

const Nord0 = Color(0xFF2E3440);
const Nord3 = Color(0xFF4C566A);
const Nord4 = Color(0xFFECEFF4);

const defaultFontWeight = FontWeight.w100;

class App extends StatelessWidget {
  final CoinRepository coinRepository;

  const App({
    Key? key,
    required this.coinRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _lockScreenOrientation();
    _setStatusBarIconsColorToDark();
    return RepositoryProvider.value(
      value: coinRepository,
      child: BlocProvider(
        create: (context) => ConverterCubit(context.read<CoinRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: _theme,
          initialRoute: Routes.converter,
          home: const ConversionView(),
        ),
      ),
    );
  }

  //TODO: refactor needed
  ThemeData get _theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Nord3,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Nord4,
          ),
        ),
        primaryColor: Nord4,
        textTheme: const TextTheme().copyWith(
          headlineSmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: Nord4,
            fontSize: 22,
          ),
          bodyMedium: const TextStyle(
            fontWeight: defaultFontWeight,
            color: Nord4,
            fontSize: 30,
          ),
          bodySmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: Nord4,
            fontSize: 18,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: Nord0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );

  void _lockScreenOrientation() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

  void _setStatusBarIconsColorToDark() => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ));
}
