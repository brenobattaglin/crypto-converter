import 'package:crypto_converter/modules/converter/cubits/cubits.dart';
import 'package:crypto_converter/modules/converter/widgets/crypto_card_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterCryptocurrencies extends StatelessWidget {
  const ConverterCryptocurrencies({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<ConverterCubit, ConverterState>(
        builder: (context, state) => GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 2,
          children: [
            for (var exchange in state.exchangeRates)
              CryptoCardWidget(
                crypto: exchange.cryptocurrency,
                rate: exchange.rate.toStringAsFixed(2),
              )
          ],
        ),
      );
}
