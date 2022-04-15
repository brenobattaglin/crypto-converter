part of 'converter_cubit.dart';

enum ConversionStatus { initial, loading, success, failure }

extension ConversionStatusX on ConversionStatus {
  bool get isInitial => this == ConversionStatus.initial;
  bool get isLoading => this == ConversionStatus.loading;
  bool get isSuccess => this == ConversionStatus.success;
  bool get isFailure => this == ConversionStatus.failure;
}

@JsonSerializable()
class ConverterState extends Equatable {
  final ConversionStatus status;
  final List<ExchangeRate> exchangeRates;

  ConverterState({
    this.status = ConversionStatus.initial,
    exchangeRates,
  }) : exchangeRates = exchangeRates ??
            List<ExchangeRate>.unmodifiable(
              [
                ExchangeRate.empty,
                ExchangeRate.empty,
                ExchangeRate.empty,
                ExchangeRate.empty,
              ],
            );

  factory ConverterState.fromJson(Map<String, dynamic> json) => _$ConverterStateFromJson(json);

  Map<String, dynamic> toJson() => _$ConverterStateToJson(this);

  ConverterState copyWith({
    ConversionStatus? status,
    List<ExchangeRate>? exchangeRates,
  }) {
    return ConverterState(
      status: status ?? this.status,
      exchangeRates: exchangeRates ??
          List<ExchangeRate>.unmodifiable([
            ExchangeRate.empty,
            ExchangeRate.empty,
            ExchangeRate.empty,
            ExchangeRate.empty,
          ]),
    );
  }

  @override
  List<Object> get props => [status, exchangeRates];
}
