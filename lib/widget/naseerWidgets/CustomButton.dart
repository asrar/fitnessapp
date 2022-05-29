import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  Color color;

  CustomButton({required this.buttonName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 600.0,
      child: Text(
        buttonName,
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.2,
            fontSize: 18.0,
            fontWeight: FontWeight.w800),
      ),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
          borderRadius: BorderRadius.circular(10.0),
          color: color
          // gradient: LinearGradient(
          //     colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])
          ),
    );
  }
}
