# crypto-converter

A cryptocurrency price tracker made with Flutter, that uses [CoinAPI](https://www.coinapi.io/) to get information.

<div align="center">
  <img src="https://github.com/brenobattaglin/crypto-converter/assets/8771994/0a612ed0-b3e5-4a64-87c5-abb1bcb0ec77" alt="app image" height="650"/>
</div>

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate your API key;
2. Run `make setup` (or the commands manually) to setup the project
3. Put your API key in `env.json` (file is created after running `make setup`);
4. Run the app via VS Code or `make run`.

### Notes

- The API key has to be stored in `env.json`. The app will not work without it.
- Stop and run the app again if you change the API key.
