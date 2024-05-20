import 'package:coin_repository/coin_repository.dart' as coin_repository;
import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

class Cryptocurrency {
  final String name;
  final IconData icon;
  final String code;

  Cryptocurrency({required this.name, required this.icon, required this.code});

  factory Cryptocurrency.fromRepository(coin_repository.Cryptocurrency cryptocurrency) {
    return Cryptocurrency(
      name: _cryptocurrencyNames[cryptocurrency] ?? empty.name,
      icon: _cryptocurrencyIcons[cryptocurrency] ?? empty.icon,
      code: _cryptocurrencyCodes[cryptocurrency] ?? empty.code,
    );
  }

  static Cryptocurrency empty = Cryptocurrency(
    name: '--',
    icon: Icons.circle,
    code: '--',
  );
}

const Map<coin_repository.Cryptocurrency, String> _cryptocurrencyNames = {
  coin_repository.Cryptocurrency.bitcoin: 'Bitcoin',
  coin_repository.Cryptocurrency.ethereum: 'Ethereum',
  coin_repository.Cryptocurrency.litecoin: 'Litecoin',
  coin_repository.Cryptocurrency.dogecoin: 'Dogecoin',
};

const Map<coin_repository.Cryptocurrency, CryptoFontIconData> _cryptocurrencyIcons = {
  coin_repository.Cryptocurrency.bitcoin: CryptoFontIcons.BTC,
  coin_repository.Cryptocurrency.ethereum: CryptoFontIcons.ETH,
  coin_repository.Cryptocurrency.litecoin: CryptoFontIcons.LTC,
  coin_repository.Cryptocurrency.dogecoin: CryptoFontIcons.DOGE,
};

const Map<coin_repository.Cryptocurrency, String> _cryptocurrencyCodes = {
  coin_repository.Cryptocurrency.bitcoin: 'BTC',
  coin_repository.Cryptocurrency.ethereum: 'ETH',
  coin_repository.Cryptocurrency.litecoin: 'LTC',
  coin_repository.Cryptocurrency.dogecoin: 'DOGE',
};
