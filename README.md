# crypto-converter

A cryptocurrency price tracker made with Flutter, that uses [CoinAPI](https://www.coinapi.io/) to get information.

<div align="center">
  <img src="https://user-images.githubusercontent.com/8771994/187002175-05fe3406-722c-4cd0-aaa9-6fe652d81f08.png" alt="app image" height="650"/>
</div>

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate your API key;
2. Go to `lib/infrastructure/coin_api/secrets.dart` and update `coinApiKey` value with the API key you received via e-mail. Otherwise, the requests for the API will always fail.
3. Run `make setup` or run a `dart pub get` command to install the dependencies;
4. Run the app.
