import 'package:cryptocurrency_converter/app.dart';
import 'package:cryptocurrency_converter/converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../converter.dart';

RefreshController _refreshController = RefreshController(initialRefresh: true);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter', style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: BlocListener<ConverterCubit, ConverterState>(
          listener: (context, state) {
            if (state.status == ConversionStatus.failure) {
              _refreshController.refreshFailed();
            } else {
              _refreshController.refreshCompleted();
            }
          },
          child: SmartRefresher(
            onRefresh: () async {
              context.read<ConverterCubit>().fetchExchangeRate();
            },
            enablePullDown: true,
            header: const WaterDropHeader(),
            controller: _refreshController,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<ConverterCubit, ConverterState>(
                    builder: (context, state) {
                      return _buildCryptoCurrencyList(context, state.exchangeRate);
                    },
                  ),
                  const DropdownButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCryptoCurrencyList(BuildContext context, ExchangeRate exchangeRate) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: [
            CryptoCardWidget(
              code: exchangeRate.cryptocurrency.code,
              rate: exchangeRate.rate.toStringAsFixed(2),
              name: exchangeRate.cryptocurrency.name,
              iconData: exchangeRate.cryptocurrency.icon,
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = 'BRL';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
      child: Column(
        children: [
          Text(
            'Select the currency:',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor: Nord0,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              items: <String>['BRL', 'USD', 'EUR'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
