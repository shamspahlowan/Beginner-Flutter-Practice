import 'package:beginner_practice/bloc_practice/cubit_practice/cubit_counter/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState());

  void increment() {
    final counterValue = state.counterValue;
    emit(
      CounterCubitState(
        counterValue: counterValue + 1,
        color: state.getColor(),
      ),
    );
  }

  void decrement() {
    final counterValue = state.counterValue;
    emit(
      CounterCubitState(
        counterValue: counterValue - 1,
        color: state.getColor(),
      ),
    );
  }
}
