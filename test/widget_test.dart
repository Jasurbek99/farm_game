import 'package:flutter_test/flutter_test.dart';
import 'package:farm_game/app/app.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const FarmGameApp());
    expect(find.byType(FarmGameApp), findsOneWidget);
  });
}
