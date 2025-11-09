import 'package:depi_flutter/todo/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays login Text', (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    expect(find.text('Login'), findsExactly(2));
  });


  testWidgets('displays First time Text', (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    expect(find.text('First time ? Sign up'), findsOneWidget);
  });


  testWidgets('Test Text field', (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    expect(find.byType(TextFormField), findsExactly(2));
  });
}
