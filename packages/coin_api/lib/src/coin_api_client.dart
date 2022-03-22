import 'dart:convert';
import 'dart:io';

import 'package:coin_api/coin_api.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when exchange rate request fails.
class ExchangeRateRequestFailure implements Exception {}

class ExchangeRateNotFoundFailure implements Exception {}

class CoinApiClient {
  static const _baseUrl = 'rest.coinapi.io';
  final String _apiKey = 'apikeyhere';
  final http.Client _httpClient;

  CoinApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<ExchangeRate> getExchangeRate(String cryptocurrency, String currency) async {
    final request = Uri.https(
      _baseUrl,
      '/v1/exchangerate/${cryptocurrency}/$currency',
    );

    final response = await _httpClient.get(
      request,
      headers: {
        'X-CoinAPI-Key': _apiKey,
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
    ) as List;

    if (json.isEmpty) {
      throw ExchangeRateRequestFailure();
    }

    return ExchangeRate.fromJson(json.first as Map<String, dynamic>);
  }
}
