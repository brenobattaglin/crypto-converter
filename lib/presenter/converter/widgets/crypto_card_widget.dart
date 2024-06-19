import 'package:crypto_converter/core/icons.dart';
import 'package:crypto_converter/core/sizes.dart';
import 'package:crypto_converter/domain/converter/models/cryptocurrency.dart';
import 'package:flutter/material.dart';

class CryptoCardWidget extends StatelessWidget {
  final Cryptocurrency crypto;
  final String rate;

  const CryptoCardWidget({
    super.key,
    required this.crypto,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildLabel(),
            _buildRate(context),
            _buildCode(context),
          ],
        ),
      );

  Widget _buildLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSizes.extraSmall),
          child: Icon(
            key: const Key('converter_card_label_icon'),
            AppIcons.getIconData(_cryptoName),
            size: AppSizes.medium,
          ),
        ),
        Text(
          key: const Key('converter_card_label_text'),
          crypto.name,
        )
      ],
    );
  }

  Widget _buildCode(BuildContext context) => Text(
        _cryptoCode,
        key: const Key('converter_card_code'),
        style: Theme.of(context).textTheme.headlineSmall,
      );

  Widget _buildRate(BuildContext context) => Text(
        rate.toString(),
        key: const Key('converter_card_rate'),
        style: Theme.of(context).textTheme.headlineSmall,
        maxLines: 1,
      );

  String get _cryptoName => crypto.name;

  String get _cryptoCode => crypto.code;
}
