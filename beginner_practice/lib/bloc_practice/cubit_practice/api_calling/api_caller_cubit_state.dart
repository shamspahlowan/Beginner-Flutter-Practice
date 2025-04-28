import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiCallerCubitState extends Equatable {
  const ApiCallerCubitState();
}

class ApiCallerCubitInitialState extends ApiCallerCubitState {
  const ApiCallerCubitInitialState();
  @override
  List<Object?> get props => [];
}

class ApiCallerCubitLoadingState extends ApiCallerCubitState {
  const ApiCallerCubitLoadingState();
  @override
  List<Object?> get props => [];
}

class ApiCallerCubitSuccessfulState extends ApiCallerCubitState {
  final List<UserModel> userList;
  const ApiCallerCubitSuccessfulState({required this.userList});
  @override
  List<Object?> get props => [userList];
}

class ApiCallerCubitFailureState extends ApiCallerCubitState {
  final String errorMessage;
  const ApiCallerCubitFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
