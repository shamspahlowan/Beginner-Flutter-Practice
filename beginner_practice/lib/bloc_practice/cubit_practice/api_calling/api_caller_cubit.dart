import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_caller_cubit_state.dart';
import 'models/user_model.dart';
import 'services/api_service.dart';

class ApiCallerCubit extends Cubit<ApiCallerCubitState> {
  final ApiService _apiService;

  ApiCallerCubit(this._apiService) : super(ApiCallerCubitInitialState());

  Future<void> getUsers() async {
    emit(ApiCallerCubitLoadingState());

    try {
      final List<UserModel> users = await _apiService.getUser();

      if (users.isEmpty) {
        emit(ApiCallerCubitFailureState(errorMessage: 'No users found.'));
      } else {
        emit(ApiCallerCubitSuccessfulState(userList: users));
      }
    } catch (e) {
      emit(ApiCallerCubitFailureState(errorMessage: 'Error: ${e.toString()}'));
    }
  }
}
