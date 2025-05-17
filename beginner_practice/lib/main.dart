import 'package:beginner_practice/bloc_practice/bloc/counter_with_bloc/counter_bloc.dart';
import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/api_caller_cubit.dart';
import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/services/api_service.dart';
import 'package:beginner_practice/bloc_practice/cubit_practice/cubit_counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beginner_practice/animation_practice/animated_canvas.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ApiCallerCubit(ApiService())),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Beginner Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AnimatedCanvas(),
    );
  }
}
