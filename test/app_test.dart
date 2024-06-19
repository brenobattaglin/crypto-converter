import 'package:crypto_converter/core/icons.dart';
import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:crypto_converter/presenter/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_converter/app.dart';

import 'mocks/setup.dart';

void main() {
  const appTabSettingsKey = Key('app_tab_settings');

  group('app widget tests', () {
    setUpAll(() => initMocks());

    group('when app is rendered', () {
      testWidgets('should build properly', (WidgetTester tester) async {
        await tester.pumpWidget(const App());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byType(App), findsOneWidget);
        expect(find.byType(BottomAppBar), findsOneWidget);
        expect(find.byType(TabBar), findsOneWidget);
        expect(find.byType(TabBarView), findsOneWidget);
        expect(find.byType(ConversionView), findsOneWidget);
        expect(find.byType(SettingsView), findsNothing);
      });

      testWidgets('should have correct tab icons', (WidgetTester tester) async {
        await tester.pumpWidget(const App());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byIcon(AppIcons.bitcoin), findsOneWidget);
        expect(find.byIcon(AppIcons.settings), findsOneWidget);
        expect(find.byKey(const Key('app_tab_conversion')), findsOneWidget);
        expect(find.byKey(appTabSettingsKey), findsOneWidget);
      });
    });

    group('when settings tab is selected', () {
      testWidgets('should navigate to settings view', (WidgetTester tester) async {
        await tester.pumpWidget(const App());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(appTabSettingsKey));
        await tester.pumpAndSettle();

        expect(find.byType(SettingsView), findsOneWidget);
        expect(find.byType(ConversionView), findsNothing);
      });
    });
  });
}
