import 'package:buzzerapp/TestCases//testvalidations.dart';
import 'package:test/test.dart';
void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 2);
  });
  test('Counter value should be decremented', () {
    final counter=Counter();
    counter.decrement();
    expect(counter.value,0);
  });
}