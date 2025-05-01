import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc.dart';
import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc_event.dart';
import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocAppUi extends StatefulWidget {
  const CounterBlocAppUi({super.key});

  @override
  State<CounterBlocAppUi> createState() => _CounterBlocAppUiState();
}

class _CounterBlocAppUiState extends State<CounterBlocAppUi> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterBlocState>(
      builder: (context, state) {
        // ignore: unused_local_variable
        int counter = 0;
        if (state is CounterBlocUpdatedState) {
          counter = state.counter;
        } else {
          counter = 0;
        }
        return Scaffold(body: Center(child: _view(context, counter)));
      },
    );
  }

  Widget _view(BuildContext context, int counter) {
    return Column(
      children: [
        Text(counter.toString()),
        FloatingActionButton.extended(
          onPressed: () {
            context.read<CounterBloc>().add(CounterBlocIncreaseEvent());
          },
          label: Text("Increase"),
        ),
        FloatingActionButton.extended(
          onPressed: () {
            context.read<CounterBloc>().add(CounterBlocDecreaseEvent());
          },
          label: Text("Decrease"),
        ),
      ],
    );
  }
}
