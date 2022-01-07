import 'dart:async';
import 'dart:html';
import 'package:coin_api/coin_api.dart' hide ExchangeRate;
import 'package:coin_repository/coin_repository.dart';

class CoinFailure implements Exception {}

class CoinRepository {
  CoinRepository({CoinApiClient? apiClient}) : _apiClient = apiClient ?? CoinApiClient();

  final CoinApiClient _apiClient;

  Future<ExchangeRate> getExchangeRate(String cryptoCurrency, String currency) async {
    final exchangeRate = await _apiClient.getExchangeRate(cryptoCurrency, currency);
    return ExchangeRate(
      cryptoCurrency: exchangeRate.assetIdBase.toCryptoCurrency,
      currency: exchangeRate.assetIdQuote.toCurrency,
      rate: exchangeRate.rate,
    );
  }
}

extension on CurrencyIdBase {
  Cryptocurrency get toCryptoCurrency {
    switch (this) {
      case CurrencyIdBase.bitcoin:
        return Cryptocurrency.bitcoin;
      case CurrencyIdBase.ethereum:
        return Cryptocurrency.ethereum;
      case CurrencyIdBase.litecoin:
        return Cryptocurrency.litecoin;
    }
  }
}

extension on CurrencyIdQuote {
  Currency get toCurrency {
    switch (this) {
      case CurrencyIdQuote.australianDollar:
        return Currency.australianDollar;
      case CurrencyIdQuote.brazilianReal:
        return Currency.brazilianReal;
      case CurrencyIdQuote.canadianDollar:
        return Currency.canadianDollar;
      case CurrencyIdQuote.chineseYuan:
        return Currency.chineseYuan;
      case CurrencyIdQuote.euro:
        return Currency.euro;
      case CurrencyIdQuote.greatBritishPound:
        return Currency.greatBritishPound;
      case CurrencyIdQuote.hongKongDollar:
        return Currency.hongKongDollar;
      case CurrencyIdQuote.indonesianRupiah:
        return Currency.indonesianRupiah;
      case CurrencyIdQuote.israeliShekel:
        return Currency.israeliShekel;
      case CurrencyIdQuote.indianRupee:
        return Currency.indianRupee;
      case CurrencyIdQuote.japaneseYen:
        return Currency.japaneseYen;
      case CurrencyIdQuote.mexicanPeso:
        return Currency.mexicanPeso;
      case CurrencyIdQuote.norwegianKroner:
        return Currency.norwegianKroner;
      case CurrencyIdQuote.newZealandDollar:
        return Currency.newZealandDollar;
      case CurrencyIdQuote.polishZloty:
        return Currency.polishZloty;
      case CurrencyIdQuote.romaniaNewLei:
        return Currency.romaniaNewLei;
      case CurrencyIdQuote.russianRuble:
        return Currency.russianRuble;
      case CurrencyIdQuote.swedishKrona:
        return Currency.swedishKrona;
      case CurrencyIdQuote.singaporeDollar:
        return Currency.singaporeDollar;
      case CurrencyIdQuote.usDollar:
        return Currency.usDollar;
      case CurrencyIdQuote.southAfricanRand:
        return Currency.southAfricanRand;
    }
  }
}
