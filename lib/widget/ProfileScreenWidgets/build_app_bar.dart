import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildAppBar({
  required String title,
  required List actions,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black, fontSize: 24),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    // actions: actions,
  );
}
