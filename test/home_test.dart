import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wi_test/models/favorites.dart';
import 'package:wi_test/screens/home.dart';

// create home screen function is used to create an app that loads the
// widget to tested in a material app , wrapped into a changeNotifierProvider.

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    // testWidget is used to test the widget that is being tested.
    testWidgets('Testing Scrolling', (tester) async {
      // Widget tests use TestFlutterWidgetsBinding, which provides the same resources to your
      // widgets that they would have in a running ap.

      // pumpWidget kicks off the process by telling the framework to build the widget tree.
      await tester.pumpWidget(createHomeScreen());

      // finder used to find widgets in the widget tree.
      // matcher is used to match the widget that is being tested.

      // Note: After the initial call to pumpWidget(), the WidgetTester provides additional ways to rebuild the same widget.

      // find text will find text in the widget tree with the given text.
      // findsOneWidget will find one widget . there may be other widget also.
      expect(find.text('Item 0'), findsOneWidget);


      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
