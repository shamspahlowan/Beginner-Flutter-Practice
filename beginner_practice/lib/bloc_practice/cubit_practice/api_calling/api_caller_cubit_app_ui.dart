import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_caller_cubit.dart';
import 'api_caller_cubit_state.dart';

class ApiCallerCubitAppUi extends StatefulWidget {
  const ApiCallerCubitAppUi({super.key});

  @override
  State<ApiCallerCubitAppUi> createState() => _ApiCallerCubitAppUiState();
}

class _ApiCallerCubitAppUiState extends State<ApiCallerCubitAppUi> {
  @override
  void initState() {
    super.initState();
    context.read<ApiCallerCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiCallerCubit, ApiCallerCubitState>(
      builder: (context, state) {
        if (state is ApiCallerCubitLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ApiCallerCubitSuccessfulState) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                final user = state.userList[index];
                return ListTile(
                  title: Text(user.id.toString()),
                  subtitle: Text(user.email.toString()),
                );
              },
            ),
          );
        } else if (state is ApiCallerCubitFailureState) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        }

        return const Center(child: Text("Press the button to fetch users"));
      },
    );
  }
}
