import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/appColors.dart';

class ButtonIconWithText extends StatelessWidget {
  final String image;
  final String title;
  final Color containercolor;
  final Color textcolor;
  final Function() ontap;
  final Color shadowColor;

  ButtonIconWithText(
      {required this.shadowColor,
      required this.ontap,
      required this.containercolor,
      required this.textcolor,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.07,
        width: Get.width * 0.75,
        decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, height: 40, child: Image.asset(image)),
            SizedBox(
              width: 10,
            ),
            Text(
              title,overflow: TextOverflow.ellipsis,maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
            )
          ],
        ),
      ),
    );
  }
}
