import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_cubit_state.dart';

class CounterCubitAppUi extends StatelessWidget {
  const CounterCubitAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterCubitState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.getColor(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${state.counterValue}",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      label: const Text("Increment"),
                      icon: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 30),
                    FloatingActionButton.extended(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      label: const Text("Decrement"),
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
