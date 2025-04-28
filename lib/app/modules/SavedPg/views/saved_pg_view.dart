import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_pg_controller.dart';

class SavedPgView extends GetView<SavedPgController> {
  const SavedPgView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SavedPgView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SavedPgView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
