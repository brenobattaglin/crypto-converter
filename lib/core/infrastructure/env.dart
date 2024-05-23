import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'COIN_API_KEY', defaultValue: 'api_key')
  static const String coinApiKey = _Env.coinApiKey;
}
