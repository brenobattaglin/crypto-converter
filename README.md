# crypto_price_tracker

A cryptocurrency price tracker that consumes [CoinAPI](https://www.coinapi.io/).

![crypt](https://user-images.githubusercontent.com/8771994/115569954-14a2b880-a294-11eb-84a5-c8d2d2c37e55.png)

## Getting Started

1. Go to [CoinAPI](https://www.coinapi.io/) and generate and API key. You'll receive an e-mail;
2. In the project, go to the `lib/data/coin_data.dart` and change the const `APIKey` value to the API key you received via e-mail.

## On Hold
- A redesigned UI
- A dialog to show errors: the app is only printing the error on the log when there's an error on the request and throwing an exception, and the user is not being warned about it.
