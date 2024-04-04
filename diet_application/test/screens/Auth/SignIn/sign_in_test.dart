import 'package:diet_application/src/presentation/screens/Auth/SignIn/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing the functionality for the sign in screen',
      (tester) async {
    await tester.pumpWidget(const SignIn());
  });
}
