import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_converter/app.dart';

import 'mocks/setup.dart';

void main() {
  group('main widget tests', () {
    setUpAll(() => initMocks());

    group('when main is called', () {
      testWidgets('should build app', (WidgetTester tester) async {
        await tester.pumpWidget(const App());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byType(App), findsOneWidget);
      });
    });
  });
}
