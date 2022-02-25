import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/presentation.dart';

const Nord0 = Color(0xFF2E3440);
const Nord4 = Color(0xFFECEFF4);
const defaultFontWeight = FontWeight.w100;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _lockScreenOrientation();
    _setStatusBarIconsColorToDark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'converter',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Nord4,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Nord0,
          ),
        ),
        primaryColor: Nord4,
        textTheme: const TextTheme().copyWith(
          headline3: const TextStyle(
            fontWeight: defaultFontWeight,
          ),
          bodyText1: const TextStyle(
            fontWeight: defaultFontWeight,
            color: Nord0,
            fontSize: 30,
          ),
          bodyText2: const TextStyle(
            fontWeight: defaultFontWeight,
            color: Nord0,
            fontSize: 18,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }

  void _lockScreenOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void _setStatusBarIconsColorToDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
  }
}
