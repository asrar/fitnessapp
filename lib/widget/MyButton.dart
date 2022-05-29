import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyButton extends StatelessWidget {
  final String title;
  final Function() ontap;
  final Color containercolor;
  final Color textcolor;

  final Color shadowColor;

  MyButton(
      {required this.shadowColor,
      required this.ontap,
      required this.containercolor,
      required this.textcolor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          height: 55,
          width: double.infinity,
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
              // Container(width: 40, height: 40, child: Image.asset(image)),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
