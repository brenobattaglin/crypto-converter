import 'package:crypto_converter/core/icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_converter/domain/converter/models/cryptocurrency.dart';
import 'package:crypto_converter/presenter/converter/widgets/crypto_card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  const crypto = Cryptocurrency(name: 'Bitcoin', code: 'BTC');
  const rate = '4312.42';
  const labelTextKey = Key('converter_card_label_text');
  const labelIconKey = Key('converter_card_label_icon');
  const codeKey = Key('converter_card_code');
  const rateKey = Key('converter_card_rate');

  Widget buildWidgetForTesting() => const MaterialApp(
        home: Scaffold(
          body: CryptoCardWidget(
            crypto: crypto,
            rate: rate,
          ),
        ),
      );

  group('crypto card widget tests', () {
    group('when card is rendered', () {
      testWidgets('should build properly', (WidgetTester tester) async {
        await tester.pumpWidget(buildWidgetForTesting());
        await tester.pump();

        final labelTextFinder = find.byKey(labelTextKey);
        final labelIconFinder = find.byKey(labelIconKey);
        final codeFinder = find.byKey(codeKey);
        final rateFinder = find.byKey(rateKey);

        final labelText = tester.widget<Text>(labelTextFinder).data;
        final codeText = tester.widget<Text>(codeFinder).data;
        final rateText = tester.widget<Text>(rateFinder).data;
        final labelIcon = tester.widget<Icon>(labelIconFinder).icon;

        expect(labelIconFinder, findsOneWidget);
        expect(labelTextFinder, findsOneWidget);
        expect(codeFinder, findsOneWidget);
        expect(rateFinder, findsOneWidget);
        expect(labelIcon, AppIcons.bitcoin);
        expect(labelText, 'Bitcoin');
        expect(codeText, 'BTC');
        expect(rateText, '4312.42');
      });
    });
  });
}
