import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static final Map<String, IconData> iconDataMap = {
    'bitcoin': CryptoFontIcons.BTC,
    'ethereum': CryptoFontIcons.ETH,
    'litecoin': CryptoFontIcons.LTC,
    'dogecoin': CryptoFontIcons.DOGE,
  };

  static IconData getIconData(String iconName) {
    return iconDataMap[iconName.toLowerCase()] ?? Icons.circle;
  }
}
