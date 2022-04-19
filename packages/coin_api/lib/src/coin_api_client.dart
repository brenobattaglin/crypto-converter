import 'dart:convert';
import 'dart:io';

import 'package:coin_api/coin_api.dart';
import 'package:http/http.dart' as http;
import 'package:coin_api/auth/auth.dart' as Secrets;
import 'package:coin_api/constants/constants.dart' as Constants;

/// Exception thrown when exchange rate request fails.
class ExchangeRateRequestFailure implements Exception {}

class ExchangeRateNotFoundFailure implements Exception {}

class ExchangeRateNoContentFailure implements Exception {}

class CoinApiClient {
  final http.Client _httpClient;

  CoinApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<ExchangeRate> getExchangeRate(String cryptocurrency, String currency) async {
    final request = Uri.https(
      Constants.url,
      '/v1/exchangerate/${cryptocurrency}/$currency',
    );

    final response = await _httpClient.get(
      request,
      headers: {
        'X-CoinAPI-Key': Secrets.coinApi,
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
