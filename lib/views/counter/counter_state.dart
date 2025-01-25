part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterStateChange extends CounterState {
  CounterStateChange(int counter) : super(counter);
}
