import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:cryptocurrency_converter/app.dart';
import 'package:cryptocurrency_converter/presentation/widgets/crypto_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter', style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_buildCryptoCurrencyList(context), const CurrencyListWidget()],
          ),
        ),
      ),
    );
  }

  _buildCryptoCurrencyList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: const [
          CryptocurrencyCardWidget(
            abbr: 'BTC',
            rate: 9.70,
            name: 'Bitcoin',
            icon: CryptoFontIcons.BTC,
            backgroundColor: Color(0xFFC08F53),
          ),
          CryptocurrencyCardWidget(
            abbr: 'ETH',
            rate: 9.70,
            name: 'Ethereum',
            icon: CryptoFontIcons.ETH,
            backgroundColor: Color(0xFF737376),
          ),
          CryptocurrencyCardWidget(
            abbr: 'LTC',
            rate: 9.70,
            name: 'Litecoin',
            icon: CryptoFontIcons.LTC,
            backgroundColor: Color(0xFF828587),
          ),
          CryptocurrencyCardWidget(
              abbr: 'DOGE',
              rate: 9.70,
              name: 'Dogecoin',
              icon: CryptoFontIcons.DOGE,
              backgroundColor: Color(0xFF9E9057)),
        ],
      ),
    );
  }
}

class CurrencyListWidget extends StatefulWidget {
  const CurrencyListWidget({Key? key}) : super(key: key);

  @override
  State<CurrencyListWidget> createState() => _CurrencyListWidgetState();
}

class _CurrencyListWidgetState extends State<CurrencyListWidget> {
  String dropdownValue = 'BRL';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.circle_outlined),
      style: const TextStyle(color: Nord0),
      borderRadius: BorderRadius.circular(10),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['BRL - Brazilian Real', 'USD', 'EUR'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


// //TODO: refactor this file
// class CryptoPage extends StatefulWidget {
//   @override
//   _CryptoPageState createState() => _CryptoPageState();
// }

// class _CryptoPageState extends State<CryptoPage> {
//   String selectedCurrency = 'USD';
//   CoinData coinData = CoinData();
//   bool isWaiting = false;
//   List<CryptoCurrency> coins = [];

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   DropdownButton<String> getAndroidDropdown() {
//     List<DropdownMenuItem<String>> dropdownItems = [];

//     for (int i = 0; i < currenciesList.length; i++) {
//       String currency = currenciesList[i];
//       var dropdownMenuItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(dropdownMenuItem);
//     }

//     return DropdownButton<String>(
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           selectedCurrency = value!;
//           getData();
//         });
//       },
//     );
//   }

//   void getData() async {
//     isWaiting = true;
//     try {
//       var data = await CoinData().getCoinData(selectedCurrency);
//       isWaiting = false;
//       setState(() {
//         coins = data;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   CupertinoPicker getIosPicker() {
//     List<Text> pickerItems = [];

//     for (String currency in currenciesList) pickerItems.add(Text(currency));

//     return CupertinoPicker(
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         selectedCurrency = currenciesList[selectedIndex];
//         getData();
//       },
//       children: pickerItems,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Crypto Price Tracker'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           makeCards(),
//           Container(
//             height: 150,
//             alignment: Alignment.center,
//             padding: const EdgeInsets.only(bottom: 30.0),
//             child: Platform.isIOS ? getIosPicker() : getAndroidDropdown(),
//           ),
//         ],
//       ),
//     );
//   }

//   Column makeCards() {
//     List<CryptoCardWidget> cryptoCards = [];
//     for (CryptoCurrency crypto in cryptocurrencies) {
//       cryptoCards.add(
//         CryptoCardWidget(
//           cryptoCurrency: crypto,
//           currency: selectedCurrency,
//           value: isWaiting ? '??' : crypto.price,
//         ),
//       );
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: cryptoCards,
//     );
//   }
// }
