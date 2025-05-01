import 'package:equatable/equatable.dart';

abstract class CounterBlocState extends Equatable {}

class CounterBlocInitState extends CounterBlocState {
  @override
  List<Object?> get props => [];
}

class CounterBlocUpdatedState extends CounterBlocState {
  final int counter;
  CounterBlocUpdatedState({required this.counter});
  @override
  List<Object?> get props => [counter];
}
