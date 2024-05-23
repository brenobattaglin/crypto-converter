# crypto-converter

A cryptocurrency price tracker made with Flutter, that uses [CoinAPI](https://www.coinapi.io/) to get information.

<div align="center">
  <img src="https://github.com/brenobattaglin/crypto-converter/assets/8771994/bc8b536c-9d12-4167-a4b4-c0e80399c977" alt="app image" height="650"/>
</div>

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate your API key;
2. Create a `.env` file on the root folder with the API key you received via e-mail, otherwise, the requests will always fail. The file content has to be like this:

   COIN_API_KEY=YOUR_API_KEY

3. Run `make setup` (or the commands inside of it) to setup the project;
4. Run the app.

## Notes

- Run `make update_dotenv_vars` every time you change the `.env` file;
- The API key is stored in `.env` and `env.g.dart` files, due to the library used to handle environment variables.
