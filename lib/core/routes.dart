import 'package:crypto_converter/modules/converter/views/conversion_view.dart';
import 'package:crypto_converter/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String converter = '/converter';
  static const String settings = '/settings';
  static const String initial = '/';
}

class RouteManager {
  static Route<MaterialPageRoute> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
      case Routes.converter:
        return MaterialPageRoute(builder: (_) => const ConversionView());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      default:
        return MaterialPageRoute(builder: (_) => const ConversionView());
    }
  }
}
