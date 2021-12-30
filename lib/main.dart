import 'package:bloc/bloc.dart';
import 'package:crypto_price_tracker/app.dart';
import 'package:crypto_price_tracker/observer.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: Observer(),
  );
}
