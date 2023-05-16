import 'dart:core';
import 'package:buzzerapp/TestCases//testvalidations.dart';
import 'package:test/test.dart';

void main() {
  test('empty text-field returns error string', (){
    bool result = FullNameValidator.validate("");
    expect(result, true);
  });
  test('Non-empty text-field navigate to next screen',(){
    bool result = FullNameValidator.validate('RemyaRemesh');
    expect(result, true);
  });
}

