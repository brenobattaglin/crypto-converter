import 'dart:convert';
import 'dart:io';

import 'package:crypto_converter/core/env.dart';
import 'package:crypto_converter/modules/coin_api/repository/models/exchange_rate.dart';
import 'package:http/http.dart' as http;

class ExchangeRateRequestFailure implements Exception {}

class ExchangeRateNotFoundFailure implements Exception {}

class ExchangeRateNoContentFailure implements Exception {}

class CoinApiClient {
  final http.Client _httpClient;
  final String url = 'rest.coinapi.io';
  final String apiKey = Env.coinApiKey;

  CoinApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<ExchangeRate> getExchangeRate(String cryptocurrency, String currency) async {
    final request = Uri.https(
      url,
      '/v1/exchangerate/$cryptocurrency/$currency',
    );

    final response = await _httpClient.get(
      request,
      headers: {
        'X-CoinAPI-Key': apiKey,
        'Accept-Encoding': 'deflate, gzip',
      },
    );

    if (response.statusCode != HttpStatus.ok) {
      throw ExchangeRateRequestFailure();
    } else if (response.statusCode == HttpStatus.notFound) {
      throw ExchangeRateNotFoundFailure();
    }

    final json = jsonDecode(
      response.body,
    ) as Map;

    if (json.isEmpty) {
      throw ExchangeRateNoContentFailure();
    }

    return ExchangeRate.fromJson(json as Map<String, dynamic>);
  }
}
