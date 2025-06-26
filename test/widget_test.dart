import 'package:flutter_test/flutter_test.dart';
import 'package:petshop_flutter/main.dart';

void main() {
  testWidgets('Verifica título do App', (WidgetTester tester) async {
    await tester.pumpWidget(const PetShopApp());
    expect(find.text('Cadastro de Animais'), findsOneWidget);
  });
}