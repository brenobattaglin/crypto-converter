import 'package:crypto_converter/core/colors.dart';
import 'package:flutter/material.dart';

abstract class Theme {
  ThemeData get theme;
}

class AppTheme extends Theme {
  final defaultFontWeight = FontWeight.w300;

  @override
  get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: _appBarTheme,
        primaryColor: AppColors.white,
        textTheme: _textTheme,
        listTileTheme: _listTileTheme,
        cardTheme: _cardTheme,
        iconTheme: _iconTheme,
      );

  AppBarTheme get _appBarTheme => const AppBarTheme(
        scrolledUnderElevation: 0,
        color: AppColors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.white,
        ),
      );

  ListTileThemeData get _listTileTheme => const ListTileThemeData().copyWith(
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.grey,
          ),
        ),
      );

  CardTheme get _cardTheme => const CardTheme().copyWith(
        color: AppColors.grey,
        shadowColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      );

  IconThemeData get _iconTheme => const IconThemeData().copyWith(
        color: AppColors.white,
      );

  TextTheme get _textTheme => const TextTheme().copyWith(
        headlineSmall: TextStyle(
          fontWeight: defaultFontWeight,
          color: AppColors.white,
          fontSize: 22,
        ),
        bodyMedium: TextStyle(
          fontWeight: defaultFontWeight,
          color: AppColors.white,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontWeight: defaultFontWeight,
          color: AppColors.white,
          fontSize: 14,
        ),
      );
}
