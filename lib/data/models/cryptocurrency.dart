import 'package:crypto_font_icons/crypto_font_icon_data.dart';

class CryptoCurrency {
  final String name;
  final CryptoFontIconData icon;
  String? price;

  CryptoCurrency({
    required this.name,
    required this.icon,
    required String? price,
  });
}
