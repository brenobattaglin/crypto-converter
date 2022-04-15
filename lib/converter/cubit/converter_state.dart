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
  final ExchangeRate exchangeRate;

  ConverterState({
    this.status = ConversionStatus.initial,
    exchangeRate,
  }) : exchangeRate = exchangeRate ?? ExchangeRate.empty;

  factory ConverterState.fromJson(Map<String, dynamic> json) => _$ConverterStateFromJson(json);

  Map<String, dynamic> toJson() => _$ConverterStateToJson(this);

  ConverterState copyWith({
    ConversionStatus? status,
    ExchangeRate? exchangeRate,
  }) {
    return ConverterState(
      status: status ?? this.status,
      exchangeRate: exchangeRate ?? ExchangeRate.empty,
    );
  }

  @override
  List<Object> get props => [status];
}
