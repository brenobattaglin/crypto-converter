import 'package:crypto_converter/core/presenter/core.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Refactor needed
const nord0 = Color(0xFF2E3440);
const nord3 = Color(0xFF4C566A);
const nord4 = Color(0xFFECEFF4);

const defaultFontWeight = FontWeight.w300;

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    _lockScreenOrientation();
    _setStatusBarIconsColorToDark();
    return BlocProvider(
      create: (context) => ConverterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: _theme,
        initialRoute: Routes.initial,
        onGenerateRoute: RouteManager.getRoute,
        home: const ConversionView(),
      ),
    );
  }

  //TODO: refactor needed
  ThemeData get _theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: nord3,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          color: Colors.transparent,
          titleTextStyle: TextStyle(
            color: nord4,
          ),
        ),
        primaryColor: nord4,
        textTheme: const TextTheme().copyWith(
          headlineSmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: nord4,
            fontSize: 22,
          ),
          bodyMedium: const TextStyle(
            fontWeight: defaultFontWeight,
            color: nord4,
            fontSize: 16,
          ),
          bodySmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: nord4,
            fontSize: 14,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: nord0,
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
