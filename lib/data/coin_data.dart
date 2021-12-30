import 'dart:convert';

import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//TODO: This is a mess, clean it up.

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

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

List<CryptoCurrency> cryptoCurrencies = [
  CryptoCurrency(name: 'BTC', icon: CryptoFontIcons.BTC, price: '??'),
  CryptoCurrency(name: 'ETH', icon: CryptoFontIcons.ETH, price: '??'),
  CryptoCurrency(name: 'LTC', icon: CryptoFontIcons.LTC, price: '??'),
];

const coinAPIURL = 'rest.coinapi.io';
const APIKey = 'YOUR-API-HERE';

class CoinData {
  Future getCoinData(String currency) async {
    for (CryptoCurrency crypto in cryptoCurrencies) {
      Uri requestUrl = Uri.https(
        coinAPIURL,
        '/v1/exchangerate/${crypto.name}/$currency',
        {'apikey': APIKey},
      );
      print(requestUrl);

      var response = await http.get(requestUrl);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        crypto.price = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoCurrencies;
  }
}
