import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static final Map<String, IconData> iconDataMap = {
    'bitcoin': bitcoin,
    'ethereum': ethereum,
    'litecoin': litecoin,
    'dogecoin': dogecoin,
  };

  static IconData getIconData(String iconName) {
    return iconDataMap[iconName.toLowerCase()] ?? Icons.circle;
  }

  static const IconData bitcoin = CryptoFontIcons.BTC;
  static const IconData dogecoin = CryptoFontIcons.DOGE;
  static const IconData ethereum = CryptoFontIcons.ETH;
  static const IconData litecoin = CryptoFontIcons.LTC;
  static const IconData settings = Icons.settings;
}
