# crypto-converter

A cryptocurrency price tracker that consumes [CoinAPI](https://www.coinapi.io/).

<div align="center">
  <img src="https://user-images.githubusercontent.com/8771994/164107081-7904de07-7ab5-4044-b015-278bdf110017.png" alt="app image" height="650"/>
</div>

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate your API key;
2. Go to `packages/coin_api/lib/auth/secrets.dart` and update `coinApi` value with your API key you received via e-mail, otherwise, the requests for the API will always fail.
3. Build the app normally.
