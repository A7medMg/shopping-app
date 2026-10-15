import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingapp/main.dart';

void main() {
  testWidgets('ShoppingApp builds successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ShoppingApp(
        initRoute: '/',
      ),
    );

    await tester.pump();
  });
}