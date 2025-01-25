import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incrementCount() {
    emit(CounterStateChange(state.counter + 1));
  }

  void decrementCount() {
    emit(CounterStateChange(state.counter - 1));
  }
}
