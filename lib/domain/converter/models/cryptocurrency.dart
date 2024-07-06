import 'package:crypto_converter/infrastructure/coin_api/models/exchange_rate_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency.g.dart';

@JsonSerializable()
class Cryptocurrency extends Equatable {
  final String name;
  final String code;

  const Cryptocurrency({required this.name, required this.code});

  factory Cryptocurrency.fromRepository(CryptocurrencyType cryptocurrency) {
    switch (cryptocurrency) {
      case CryptocurrencyType.bitcoin:
        return const Bitcoin();
      case CryptocurrencyType.ethereum:
        return const Ethereum();
      case CryptocurrencyType.litecoin:
        return const Litecoin();
      case CryptocurrencyType.dogecoin:
        return const Dogecoin();
      default:
        return Cryptocurrency.empty;
    }
  }

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => _$CryptocurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CryptocurrencyToJson(this);

  static Cryptocurrency empty = const Cryptocurrency(
    name: '--',
    code: '--',
  );

  @override
  List<Object?> get props => [name, code];
}

class Bitcoin extends Cryptocurrency {
  const Bitcoin() : super(name: 'Bitcoin', code: 'BTC');
}

class Ethereum extends Cryptocurrency {
  const Ethereum() : super(name: 'Ethereum', code: 'ETH');
}

class Litecoin extends Cryptocurrency {
  const Litecoin() : super(name: 'Litecoin', code: 'LTC');
}

class Dogecoin extends Cryptocurrency {
  const Dogecoin() : super(name: 'Dogecoin', code: 'DOGE');
}
