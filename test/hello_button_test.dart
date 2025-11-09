import 'package:depi_flutter/widgets/hello_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays button with text', (tester) async {
    await tester.pumpWidget(MaterialApp(home: HelloButton()));
    expect(find.text('Say Hello'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
