import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String converter = '/converter';
  static const String initial = '/';
}

class RouteManager {
  static Route<MaterialPageRoute> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
      case Routes.converter:
        return MaterialPageRoute(builder: (_) => const ConversionView());
      default:
        return MaterialPageRoute(builder: (_) => const ConversionView());
    }
  }
}
