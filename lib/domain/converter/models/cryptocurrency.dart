import 'package:crypto_converter/infrastructure/coin_api/models/exchange_rate_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency.g.dart';

@JsonSerializable()
class Cryptocurrency {
  final String name;
  final String code;

  Cryptocurrency({required this.name, required this.code});

  factory Cryptocurrency.fromRepository(CryptocurrencyType cryptocurrency) {
    switch (cryptocurrency) {
      case CryptocurrencyType.bitcoin:
        return Bitcoin();
      case CryptocurrencyType.ethereum:
        return Ethereum();
      case CryptocurrencyType.litecoin:
        return Litecoin();
      case CryptocurrencyType.dogecoin:
        return Dogecoin();
      default:
        return Cryptocurrency.empty;
    }
  }

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => _$CryptocurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CryptocurrencyToJson(this);

  static Cryptocurrency empty = Cryptocurrency(
    name: '--',
    code: '--',
  );
}

class Bitcoin extends Cryptocurrency {
  Bitcoin() : super(name: 'Bitcoin', code: 'BTC');
}

class Ethereum extends Cryptocurrency {
  Ethereum() : super(name: 'Ethereum', code: 'ETH');
}

class Litecoin extends Cryptocurrency {
  Litecoin() : super(name: 'Litecoin', code: 'LTC');
}

class Dogecoin extends Cryptocurrency {
  Dogecoin() : super(name: 'Dogecoin', code: 'DOGE');
}
