import 'package:flutter/material.dart';

Widget buildTextButton({required String buttonText, required Function() onTap}) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(primary: Colors.grey),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20),
      ),
    ),
  );
}
