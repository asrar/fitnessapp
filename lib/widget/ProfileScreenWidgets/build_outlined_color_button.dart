import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildOutlinedColorButton({required Color textColor,required Color containerColor,required Color borderColor,required String buttonText, required Function() onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.09,
        decoration: BoxDecoration(
            color:  containerColor,
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          buttonText,
          style:  TextStyle(fontSize: 20, color: textColor),
        )),
      ),
    ),
  );
}
