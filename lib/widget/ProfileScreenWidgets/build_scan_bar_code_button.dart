import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget scanBarCodeButton({
  required String buttonText,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: Get.height * 0.07,
      width: double.infinity,
      child: Center(
          child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      )),
      decoration: BoxDecoration(
        color:  Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
