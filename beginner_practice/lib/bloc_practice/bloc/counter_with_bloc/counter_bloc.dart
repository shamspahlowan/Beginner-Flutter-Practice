import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc_event.dart';
import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  int counter = 0;
  CounterBloc() : super(CounterBlocInitState()) {
    on<CounterBlocIncreaseEvent>((event, emit) {
      counter += 1;
      emit(CounterBlocUpdatedState(counter: counter));
    });

    on<CounterBlocDecreaseEvent>((event, emit) {
      counter -= 1;
      emit(CounterBlocUpdatedState(counter: counter));
    });
  }
}
