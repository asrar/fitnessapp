import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowWidget extends StatelessWidget {
  final String title1;
  final String title2;

  RowWidget({required this.title2, required this.title1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: TextStyle(color: Colors.grey),
        ),
        Container(
            width: Get.width*0.5,
            child: Text(title2,textAlign: TextAlign.center,),),
      ],
    );
    ;
  }
}
