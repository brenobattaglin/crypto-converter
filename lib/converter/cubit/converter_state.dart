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

  const ConverterState({this.status = ConversionStatus.initial});

  factory ConverterState.fromJson(Map<String, dynamic> json) => _$ConverterStateFromJson(json);

  Map<String, dynamic> toJson() => _$ConverterStateToJson(this);

  @override
  List<Object> get props => [];
}

class ConverterInitial extends ConverterState {}
