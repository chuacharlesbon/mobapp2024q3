import 'dart:developer';

import 'package:flutter/material.dart';

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key, this.title});

  final String? title;

  @override
  State<DrawerAdmin> createState() => _MyDrawerAdminState();
}

class _MyDrawerAdminState extends State<DrawerAdmin> {

  bool isCollapsed = false;

  void initData() {
    log("Initialize drawer component");
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Row(
        children: [
          Expanded(child: Icon(Icons.home)),
          Expanded(child: Icon(Icons.home)),
          Expanded(child: Icon(Icons.home)),
          Expanded(child: Icon(Icons.home)),
          Expanded(child: Icon(Icons.home)),
        ],
      ),
    );
  }
}