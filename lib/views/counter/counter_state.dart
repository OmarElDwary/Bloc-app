part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);

  @override
  String toString() => '$counter';
}
