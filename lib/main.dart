import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobapp2024q3/cubits/init_cubit.dart';
import 'package:mobapp2024q3/cubits/my_app_cubit/my_app_cubit.dart';

void main() {
  initializeCubits();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          color: Colors.red,
        ),
        nextScreen: const MyHomePage(title: 'My Mobile').animate().fadeIn(),
        splashIconSize: double.infinity,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initData() {
    log("Initialize main widget");
    final myAppCubit = GetIt.instance<MyAppCubit>();
    myAppCubit.testServer();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = GetIt.instance;
    final myAppCubit = GetIt.instance<MyAppCubit>();
    return BlocBuilder<MyAppCubit, MyAppState>(
      bloc: myAppCubit,
      builder: (context, state) {
        return MaterialApp.router(
          title: 'My Mobile',
          routerConfig: serviceLocator<GoRouter>(), //_router,
        );
      }
    );
  }
}
