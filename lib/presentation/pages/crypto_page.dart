import 'package:crypto_price_tracker/data/coin_data.dart';
import 'package:crypto_price_tracker/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CryptoPage extends StatefulWidget {
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
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
          selectedCurrency = value!;
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
    List<CryptoCardWidget> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCardWidget(
          cryptoCurrency: crypto,
          currency: selectedCurrency,
          value: isWaiting ? '??' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }
}
