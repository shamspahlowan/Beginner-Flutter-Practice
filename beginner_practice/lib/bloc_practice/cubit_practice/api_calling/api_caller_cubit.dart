import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/api_caller_cubit_state.dart';
import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallerCubit extends Cubit<ApiCallerCubitState> {
  List<UserModel> userList = [];
  ApiCallerCubit() : super(ApiCallerCubitInitialState());

  void getUsers() async{
    emit(ApiCallerCubitLoadingState());
  }
}
