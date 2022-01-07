import 'package:http/http.dart' as http;
import 'package:coin_api/coin_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('CoinApiClient', () {
    late http.Client httpClient;
    late CoinApiClient coinApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      coinApiClient = CoinApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(CoinApiClient(), isNotNull);
      });
    });

    group('getExchangeRate', () {
      const cryptocurrency = 'mock-cryptocurrency';
      const currency = 'mock-currency';
      const apiKey = 'mock-api-key';
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        try {
          await coinApiClient.getExchangeRate('ETH', 'USD');
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https(
              'www.coinapi.io',
              '/v1/exchangerate',
              <String, String>{'apiKey': apiKey},
            ),
          ),
        ).called(1);
      });

      test('throws ExchangeRateRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => await coinApiClient.getExchangeRate(cryptocurrency, currency),
          throwsA(isA<ExchangeRateRequestFailure>()),
        );
      });

      test('throws ExchangeRateNotFoundFailure on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        await expectLater(
          coinApiClient.getExchangeRate(cryptocurrency, currency),
          throwsA(isA<ExchangeRateNotFoundFailure>()),
        );
      });

      test('returns Exchange rate on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '''[{
            "time": "2022-01-05T19:59:13.8000000Z",
            "asset_id_base": "ETH",
            "asset_id_quote": "USD",
            "rate": 42
          }]''',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await coinApiClient.getExchangeRate(cryptocurrency, currency);
        expect(
          actual,
          isA<ExchangeRate>()
              .having((exr) => exr.time, 'title', 'mock-title')
              .having((exr) => exr.assetIdBase, 'asset_id_base', CurrencyIdBase.ethereum)
              .having((exr) => exr.assetIdQuote, 'asset_id_quote', CurrencyIdQuote.usDollar)
              .having((exr) => exr.rate, 'rate', 42),
        );
      });
    });
  });
}
