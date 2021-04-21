import 'package:crypto_price_tracker/data/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();
  bool isWaiting = false;
  Map<String, String> coinValues = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  DropdownButton<String> getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var dropdownMenuItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(dropdownMenuItem);
    }

    return DropdownButton<String>(
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  CupertinoPicker getIosPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) pickerItems.add(Text(currency));

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getData();
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Price Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          makeCards(),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            child: Platform.isIOS ? getIosPicker() : getAndroidDropdown(),
          ),
        ],
      ),
    );
  }

  Column makeCards() {
    List<CryptoCoinCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCoinCard(
          cryptoCurrency: crypto,
          currency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }
}

class CryptoCoinCard extends StatelessWidget {
  const CryptoCoinCard({this.cryptoCurrency, this.currency, this.value});

  final String cryptoCurrency;
  final String currency;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 25.0,
          ),
          child: Text(
            '1 $cryptoCurrency = $value $currency',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
