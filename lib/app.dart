import 'package:crypto_converter/core/presenter/core.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Refactor needed
const Nord0 = Color(0xFF2E3440);
const Nord3 = Color(0xFF4C566A);
const Nord4 = Color(0xFFECEFF4);

const defaultFontWeight = FontWeight.w100;

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
        scaffoldBackgroundColor: Nord3,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          color: Colors.transparent,
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
