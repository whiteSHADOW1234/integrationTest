import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:itest/main.dart' as app;






void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Tap the increment button 10 times with 1 second delay",
      (WidgetTester tester) async {
        // setup
        app.main();
        await tester.pumpAndSettle();

        final button = find.byIcon(Icons.add);

        for (var i = 0; i < 10; i++) {
          await tester.tap(button);
          await Future.delayed(const Duration(seconds: 1));
        }
        await tester.pumpAndSettle();

        expect(find.text('10'), findsOneWidget);
    },
  );
}