import 'package:crypto_converter/converter/cubit/converter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConversionStatusX', () {
    test('returns correct values for ConversionStatus.initial', () {
      const status = ConversionStatus.initial;
      expect(status.isInitial, true);
      expect(status.isLoading, false);
      expect(status.isSuccess, false);
      expect(status.isFailure, false);
    });
    test('returns correct values for ConversionStatus.loading', () {
      const status = ConversionStatus.loading;
      expect(status.isInitial, false);
      expect(status.isLoading, true);
      expect(status.isSuccess, false);
      expect(status.isFailure, false);
    });
    test('returns correct values for ConversionStatus.success', () {
      const status = ConversionStatus.success;
      expect(status.isInitial, false);
      expect(status.isLoading, false);
      expect(status.isSuccess, true);
      expect(status.isFailure, false);
    });
    test('returns correct values for ConversionStatus.failure', () {
      const status = ConversionStatus.failure;
      expect(status.isInitial, false);
      expect(status.isLoading, false);
      expect(status.isSuccess, false);
      expect(status.isFailure, true);
    });
  });
}
