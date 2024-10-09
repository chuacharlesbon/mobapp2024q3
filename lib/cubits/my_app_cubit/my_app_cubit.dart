import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobapp2024q3/cubits/my_app_cubit/my_app_repository.dart';
import 'package:mobapp2024q3/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'my_app_state.dart';

class MyAppCubit extends Cubit<MyAppState> {
  late final MyAppRepository myAppRepository;
  MyAppCubit() : super(const MyAppState()) {
    myAppRepository = MyAppRepository();
  }

  void testServer() async {
    final response = myAppRepository.testServer(
      referrer: "My Admin"
    );
    debugPrint(response.toString());
    emit(
      state.copyWith(
        status: StateStatus.loaded,
      ),
    );
  }
}
