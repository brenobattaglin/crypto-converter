import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_converter/app.dart';
import 'package:cryptocurrency_converter/observer.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: Observer(),
  );
}
