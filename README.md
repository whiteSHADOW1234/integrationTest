# itest
- Short for `Integration Test` for Flutter
- An example of how to use integration_test in flutter
- It will automatically press the button with add icon on the screen 10 times with 1 second delay
### Goal
Run and test the mobile app without human interaction
### Steps
1. Add the `integration_test` below `dev_dependencies` in `pubspec.yaml` like this:
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
```
2. Run `flutter pub get` in terminal
3. Next, create a `integration_test` folder with an `app_test.dart` file in it.
4. Then, change the script below and paste them in `app_test.dart`:
```
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:YOUR_PROJECT_NAME/main.dart' as app;



void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "DESCRIPTION_OF_YOUR_TEST",
      (WidgetTester tester) async {
        // setup (including finding the widgets you want to test)
        app.main();
        await tester.pumpAndSettle();
        
        final button = find.byIcon(Icons.add);
        
        
        
        // do the testing stuff
        for (var i = 0; i < 10; i++) {
          await tester.tap(button);
          await Future.delayed(const Duration(seconds: 1));
        }
        await tester.pumpAndSettle();
        
        
        
        // check if the result is matched or not
        expect(find.text('10'), findsOneWidget);
    },
  );
}
```
5. Run `flutter test integration_test` in terminal or press the `testing` button in the left side in VScode and press `Debug Test` button



| testing button                       | Debug Test button                    |
| ------------------------------------ | ------------------------------------ |
| ![](https://i.imgur.com/DtBnz44.png) | ![](https://i.imgur.com/HkJLUTr.png) |


### Result
![](https://i.imgur.com/wqFRe1C.png)




