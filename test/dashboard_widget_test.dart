import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should display the main image when the Dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets(
      'Should display the transfer feature when the Dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    // final iconTransferFeatureItem = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    // expect(iconTransferFeatureItem, findsOneWidget);
    // final nameTransferFeatureItem = find.widgetWithText(FeatureItem, 'Transfer');
    // expect(nameTransferFeatureItem, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);
  });

  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transactionFeedFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transaction Feed', Icons.description));
    expect(transactionFeedFeatureItem, findsOneWidget);
    // final iconTransactionFeedFeatureItem =
    //     find.widgetWithIcon(FeatureItem, Icons.description);
    // expect(iconTransactionFeedFeatureItem, findsOneWidget);
    // final nameTransactionFeedFeatureItem =
    //     find.widgetWithText(FeatureItem, 'Transaction Feed');
    // expect(nameTransactionFeedFeatureItem, findsOneWidget);
  });

  // testWidgets('Should display the first feature when the Dashboard is opened', (tester) async{
  // await tester.pumpWidget(MaterialApp(home: Dashboard()));
  // final firstFeature = find.byType(FeatureItem);
  // expect(firstFeature, findsWidgets);
  // });
}

bool featureItemMatcher(Widget widget, String name, IconData icon) {
  if (widget is FeatureItem) {
    return widget.name == name && widget.icon == icon;
  }
  return false;
}
