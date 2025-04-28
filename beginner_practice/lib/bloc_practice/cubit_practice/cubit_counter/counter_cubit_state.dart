import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CounterCubitState extends Equatable {
  final int counterValue;
  final Color color;

  const CounterCubitState({this.counterValue = 0, this.color = Colors.white});
  bool get isZero => counterValue == 0;
  bool get isPositive => counterValue > 0;
  bool get isNegative => counterValue < 0;

  Color getColor() {
    if (isZero) {
      return Colors.red;
    } else if (isPositive) {
      return Colors.green;
    } else {
      return Colors.blueAccent;
    }
  }

  @override
  List<Object> get props => [counterValue, color];
}

// class CounterCubitInitialState extends CounterCubitState {
//   final int counterValue;
//   final Color color;
//   const CounterCubitInitialState({
//     this.counterValue = 0,
//     this.color = Colors.deepPurple,
//   });
// }

// class CounterCubitChangedState extends CounterCubitState {
//   final int counterValue;
//   final Color color = Colors.lightGreen;
//   const CounterCubitChangedState(this.counterValue);

//   @override
//   List<Object> get props => [counterValue];
// }

// class CounterCubitZeroState extends CounterCubitState {
//   final Color color = Colors.redAccent;
//   const CounterCubitZeroState();
// }
