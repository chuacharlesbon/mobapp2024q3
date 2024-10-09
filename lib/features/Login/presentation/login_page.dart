import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobapp2024q3/components/drawer.dart';
import 'package:mobapp2024q3/routes/route_names.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.title});

  final String? title;

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {

  void initData() {
    log("Initialize Login screen");
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: const Icon(
          Icons.person
        ),
        leadingWidth: 36,
        actions: const [
          SizedBox(
            width: 36,
            child: Icon(
              Icons.menu
            ),
          )
        ]
      ),
      bottomNavigationBar: const DrawerAdmin(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple.withOpacity(0.2),
        child: GestureDetector(
          onTap: () {
            GetIt.instance<GoRouter>().goNamed(Routes.home.name);
          },
          child: const Text(
            'Login'
          ),
        )
      ),
    );
  }
}