import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/presentation.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'converter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff2e3440),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: const Color(0xff2e3440),
        textTheme: TextTheme().copyWith(
          headline3: const TextStyle(fontWeight: FontWeight.w100),
          bodyText1: const TextStyle(fontWeight: FontWeight.w100),
        ),
        cardTheme: CardTheme().copyWith(
          color: const Color(0xff2e3440),
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        cardColor: const Color(0xff2e3440),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffeceff4),
        ),
      ),
      home: HomePage(),
    );
  }
}
