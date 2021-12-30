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
      title: 'Cryptocurrency Converter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff2F3543),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: const Color(0xff2F3543),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffeceff4),
        ),
      ),
      home: CryptoPage(),
    );
  }
}
