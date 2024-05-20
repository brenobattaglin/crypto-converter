import 'package:crypto_converter/presenter/converter/converter.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String converter = '/converter';
}

class RouteManager {
  static Route<MaterialPageRoute> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.converter:
        return MaterialPageRoute(builder: (_) => const ConversionView());
      default:
        return MaterialPageRoute(builder: (_) => const ConversionView());
    }
  }
}
