import 'dart:core';

import 'package:coin_repository/coin_repository.dart' show CoinRepository;
import 'package:crypto_converter/domain/converter/converter.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'converter_cubit.g.dart';
part 'converter_state.dart';

class ConverterCubit extends HydratedCubit<ConverterState> {
  ConverterCubit(this._coinRepository) : super(ConverterState());

  final CoinRepository _coinRepository;

  @override
  ConverterState? fromJson(Map<String, dynamic> json) => ConverterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ConverterState state) => state.toJson();

  Future<void> fetchExchangeRates(String currencyCode) async {
    emit(state.copyWith(status: ConversionStatus.loading));

    try {
      final btcResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('BTC', currencyCode),
      );
      final ethResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('ETH', currencyCode),
      );
      final lthResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('LTC', currencyCode),
      );
      final dogeResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('DOGE', currencyCode),
      );

      emit(state.copyWith(
        status: ConversionStatus.success,
        exchangeRates: List<ExchangeRate>.unmodifiable([
          btcResponse,
          ethResponse,
          lthResponse,
          dogeResponse,
        ]),
      ));
    } on Exception {
      emit(state.copyWith(status: ConversionStatus.failure));
    }
  }
}
