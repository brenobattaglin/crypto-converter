# crypto-converter

A cryptocurrency price tracker app that uses [CoinAPI](https://www.coinapi.io/).

<div align="center">
  <img src="https://github.com/brenobattaglin/crypto-converter/assets/8771994/7d0a6e21-5894-425f-980b-0921bffb5d3b" alt="app image" height="650"/>
</div>

## Getting Started

1. Get your API key on [CoinAPI](https://www.coinapi.io/);
2. Run `make setup` (or the commands manually on the Makefile) to setup the project;
3. Put your API key in `env.json` (file is created after running `make setup`);
4. Run the app via VS Code or `make run`.

### Notes

- The API key has to be stored in `env.json`. The app does not work without it.
- Stop and run the app again if you change the API key.
