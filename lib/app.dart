import 'package:crypto_converter/core/colors.dart';
import 'package:crypto_converter/core/routes.dart';
import 'package:crypto_converter/core/strings.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const defaultFontWeight = FontWeight.w300;

class App extends StatefulWidget {
  const App({
    super.key,
  });

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
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          color: AppColors.transparent,
          titleTextStyle: TextStyle(
            color: AppColors.white,
          ),
        ),
        primaryColor: AppColors.white,
        textTheme: const TextTheme().copyWith(
          headlineSmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: AppColors.white,
            fontSize: 22,
          ),
          bodyMedium: const TextStyle(
            fontWeight: defaultFontWeight,
            color: AppColors.white,
            fontSize: 16,
          ),
          bodySmall: const TextStyle(
            fontWeight: defaultFontWeight,
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: AppColors.grey,
          shadowColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        iconTheme: const IconThemeData().copyWith(
          color: AppColors.white,
        ),
      );

  void _lockScreenOrientation() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

  void _setStatusBarIconsColorToDark() => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ));
}
