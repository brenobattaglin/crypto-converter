import 'package:json_annotation/json_annotation.dart';
import 'package:coin_api/coin_api.dart';
import 'package:test/test.dart';

void main() {
  group('Exchange Rate', () {
    group('fromJson', () {
      test('throws CheckedFromJsonException when asset_id_base is unknown', () {
        expect(
          () => ExchangeRate.fromJson(<String, dynamic>{
            'time': 'mock-title',
            'asset_id_base': 'Unknown',
            'asset_id_quote': 'BRL',
            'rate': 17,
          }),
          throwsA(isA<CheckedFromJsonException>()),
        );
      });
    });
  });
}
