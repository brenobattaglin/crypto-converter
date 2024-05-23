import 'dart:async';
import 'package:coin_api/coin_api.dart' hide ExchangeRate;
import 'package:crypto_converter/infrastructure/coin_api/models/exchange_rate_data.dart';

class CoinFailure implements Exception {}

class CoinRepository {
  CoinRepository({CoinApiClient? apiClient}) : _apiClient = apiClient ?? CoinApiClient();

  final CoinApiClient _apiClient;

  Future<ExchangeRateData> getExchangeRate(String cryptoCurrency, String currency) async {
    final exchangeRate = await _apiClient.getExchangeRate(cryptoCurrency, currency);
    return ExchangeRateData(
      cryptoCurrency: exchangeRate.assetIdBase.toCryptoCurrency,
      currency: exchangeRate.assetIdQuote.toCurrency,
      rate: exchangeRate.rate,
    );
  }
}

extension on CurrencyIdBase {
  CryptocurrencyType get toCryptoCurrency {
    switch (this) {
      case CurrencyIdBase.bitcoin:
        return CryptocurrencyType.bitcoin;
      case CurrencyIdBase.ethereum:
        return CryptocurrencyType.ethereum;
      case CurrencyIdBase.litecoin:
        return CryptocurrencyType.litecoin;
      case CurrencyIdBase.dogecoin:
        return CryptocurrencyType.dogecoin;
    }
  }
}

extension on CurrencyIdQuote {
  CurrencyType get toCurrency {
    switch (this) {
      case CurrencyIdQuote.australianDollar:
        return CurrencyType.australianDollar;
      case CurrencyIdQuote.brazilianReal:
        return CurrencyType.brazilianReal;
      case CurrencyIdQuote.canadianDollar:
        return CurrencyType.canadianDollar;
      case CurrencyIdQuote.chineseYuan:
        return CurrencyType.chineseYuan;
      case CurrencyIdQuote.euro:
        return CurrencyType.euro;
      case CurrencyIdQuote.greatBritishPound:
        return CurrencyType.greatBritishPound;
      case CurrencyIdQuote.hongKongDollar:
        return CurrencyType.hongKongDollar;
      case CurrencyIdQuote.indonesianRupiah:
        return CurrencyType.indonesianRupiah;
      case CurrencyIdQuote.israeliShekel:
        return CurrencyType.israeliShekel;
      case CurrencyIdQuote.indianRupee:
        return CurrencyType.indianRupee;
      case CurrencyIdQuote.japaneseYen:
        return CurrencyType.japaneseYen;
      case CurrencyIdQuote.mexicanPeso:
        return CurrencyType.mexicanPeso;
      case CurrencyIdQuote.norwegianKroner:
        return CurrencyType.norwegianKroner;
      case CurrencyIdQuote.newZealandDollar:
        return CurrencyType.newZealandDollar;
      case CurrencyIdQuote.polishZloty:
        return CurrencyType.polishZloty;
      case CurrencyIdQuote.romaniaNewLei:
        return CurrencyType.romaniaNewLei;
      case CurrencyIdQuote.russianRuble:
        return CurrencyType.russianRuble;
      case CurrencyIdQuote.swedishKrona:
        return CurrencyType.swedishKrona;
      case CurrencyIdQuote.singaporeDollar:
        return CurrencyType.singaporeDollar;
      case CurrencyIdQuote.usDollar:
        return CurrencyType.usDollar;
      case CurrencyIdQuote.southAfricanRand:
        return CurrencyType.southAfricanRand;
    }
  }
}
