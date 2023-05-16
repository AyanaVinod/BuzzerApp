
import 'package:buzzerapp/Screens/CurrentSession.dart';
import 'package:buzzerapp/TestCases//testvalidations.dart';
import 'package:test/test.dart';

void main() {
  test('Pin is incorrect', () {
    bool result = PinCodeValidator.validate("1234");
    expect(result, true);
  });
  test('Pin is Correct.Join', () {
    bool result = PinCodeValidator.validate('22222');
    expect(result, true);
  });
  test('Pin is correct', () {
    bool result=PinCodeValidator.validate(pinNumber);
    expect(result,true);
  });
}