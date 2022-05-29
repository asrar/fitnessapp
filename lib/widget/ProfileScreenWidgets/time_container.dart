import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget timeContainer(
    {required Color color,
    required int time,
    required String timeInWords,
    required Function() ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 54,
      width: Get.width * 0.15,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(width: 1),
          shape: BoxShape.circle,
          border: Border.all(color: color)
          // boxShadow: [
          //   BoxShadow(color: Colors.black),
          // ],
          ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time.toString()),
            Text(timeInWords),
          ],
        ),
      ),
    ),
  );
}
