import 'package:flutter/material.dart';

class RecommendationScreenWidget extends StatelessWidget {
  final Function() ontap;
  final String title;
  final Color bordercolor, containercolor;

  RecommendationScreenWidget(
      {required this.ontap,
      required this.title,
      required this.containercolor,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: bordercolor)),
        child: Center(child: Text(title)),
      ),
    );
    ;
  }
}
