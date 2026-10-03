import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lego_city/main.dart';

void main() {
  testWidgets('App loads main navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const LegoHarryPotterApp());
    expect(find.text('Characters'), findsWidgets);
  });
}
