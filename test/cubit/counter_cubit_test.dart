import 'package:bloc_concept/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Cubit Test", () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test("Test if counterstate has right initial value", () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: true));
    });

    blocTest<CounterCubit, CounterState>(
      """
        Test Case : Testing Increment Function
        Initial Value : CounterState(counterValue: 0, wasIncremented: true)
        Expected : CounterState(counterValue: 1, wasIncremented: true)
      """,
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      """
        Test Case : Testing Decrement Function
        Initial Value : CounterState(counterValue: 0, wasIncremented: true)
        Expected : CounterState(counterValue: -1, wasIncremented: false)
      """,
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
