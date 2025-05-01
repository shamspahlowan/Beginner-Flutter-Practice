import 'package:equatable/equatable.dart';

abstract class CounterBlocEvent extends Equatable {}

class CounterBlocIncreaseEvent extends CounterBlocEvent {
  @override
  List<Object?> get props => [];
}

class CounterBlocDecreaseEvent extends CounterBlocEvent {
  @override
  List<Object?> get props => [];
}
