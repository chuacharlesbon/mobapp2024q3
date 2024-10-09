import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobapp2024q3/cubits/my_app_cubit/my_app_cubit.dart';
import 'package:mobapp2024q3/routes/route_names.dart';
import 'package:mobapp2024q3/routes/router.dart';

void initializeCubits() {
  log("Initialize cubits");
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: Routes.home.path,
      routes: MyRoutes.myRoutes,
    ),
  );
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions.defaultOptions,
    ),
  );
  serviceLocator.registerLazySingleton<MyAppCubit>(() => MyAppCubit());
  
  log("Initialize cubits completed");
}