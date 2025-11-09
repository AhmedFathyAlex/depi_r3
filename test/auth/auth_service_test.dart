import 'package:depi_flutter/screens/main_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final service = AuthServiceTestable();
  test('validates email correctly', () {
    expect(service.isValidEmail('test@example.com'), true);
    expect(service.isValidEmail('invalid.com'), false);
  });


test('validates password correctly', () {
    expect(service.isValidPassword('12345'), true);
    expect(service.isValidPassword('123'), false);
  });
}