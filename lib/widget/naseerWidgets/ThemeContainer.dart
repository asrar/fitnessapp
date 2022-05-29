import 'package:flutter/material.dart';

import 'FlutterSwitchWidget.dart';

class ThemeContainer extends StatelessWidget {
  String txt;
  bool status=false;
  IconData icon;
  ThemeContainer({required this.icon,required this.status,required this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(icon),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    txt,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [FlutterSwitchWidget(
              status: this.status,
            )],
          )
        ],
      ),
    );
  }
}
