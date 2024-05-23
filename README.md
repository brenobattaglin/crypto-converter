# crypto-converter

A cryptocurrency price tracker made with Flutter, that uses [CoinAPI](https://www.coinapi.io/) to get information.

<div align="center">
  <img src="https://user-images.githubusercontent.com/8771994/187002175-05fe3406-722c-4cd0-aaa9-6fe652d81f08.png" alt="app image" height="650"/>
</div>

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate your API key;
2. Create a `.env` file on the root folder with the API key you received via e-mail, otherwise, the requests will always fail. The file content has to be like this:

   COIN_API_KEY=YOUR_API_KEY

3. Run `make setup` (or the commands inside of it) to setup the project;
4. Run the app.

## Notes

If you update your API key for some reason, make sure to run `update_dotenv_vars` to update the environment variables for the application. Then the requests will work with the new value.
