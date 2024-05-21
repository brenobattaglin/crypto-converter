import 'package:crypto_converter/app.dart';
import 'package:crypto_converter/domain/converter/converter.dart';
import 'package:crypto_converter/presenter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../converter.dart';

RefreshController _refreshController = RefreshController(initialRefresh: true);

class ConversionView extends StatefulWidget {
  const ConversionView({Key? key}) : super(key: key);

  @override
  State<ConversionView> createState() => _ConversionViewState();
}

class _ConversionViewState extends State<ConversionView> {
  late Currency selectedCurrency;

  @override
  void initState() {
    selectedCurrency = SupportedCurrencies.list.entries.first.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName, style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: BlocListener<ConverterCubit, ConverterState>(
          listener: (context, state) {
            if (state.status == ConversionStatus.failure) {
              _refreshController.refreshFailed();
            } else if (state.status == ConversionStatus.success) {
              _refreshController.refreshCompleted();
            }
          },
          child: SmartRefresher(
            onRefresh: () async {
              context.read<ConverterCubit>().fetchExchangeRates(selectedCurrency.code);
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
                      return _buildCryptoCurrencyList(context, state.exchangeRates);
                    },
                  ),
                  DropdownButtonWidget(selectedCurrency),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCryptoCurrencyList(BuildContext context, List<ExchangeRate> exchangeRates) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: [
            for (var exchange in exchangeRates)
              CryptoCardWidget(
                code: exchange.cryptocurrency.code,
                rate: exchange.rate.toStringAsFixed(2),
                name: exchange.cryptocurrency.name,
                iconData: exchange.cryptocurrency.icon,
              )
          ],
        ),
      ),
    );
  }
}

class DropdownButtonWidget extends StatefulWidget {
  Currency selectedCurrency;

  DropdownButtonWidget(this.selectedCurrency, {Key? key});

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late Currency currentCurrencySelected;
  @override
  void initState() {
    currentCurrencySelected = widget.selectedCurrency;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
      child: Column(
        children: [
          Text(
            'Select the currency:',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor: Nord0,
              value: currentCurrencySelected,
              icon: const Icon(Icons.arrow_downward),
              items: SupportedCurrencies.list.entries.map((entry) {
                return DropdownMenuItem<Currency>(
                  value: entry.value,
                  child: Text(
                    entry.key,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }).toList(),
              onChanged: (Currency? newValue) {
                setState(() {
                  currentCurrencySelected = newValue!;
                  _refreshController.requestRefresh(needMove: true);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
