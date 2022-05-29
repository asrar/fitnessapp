import 'package:flutter/material.dart';
import 'naseerWidgets/FlutterSwitchWidget.dart';

class NotificationWidget extends StatelessWidget {
  String txt;
  String text2;
  bool status=false;
  NotificationWidget({required this.text2,required this.status,required this.txt});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: TextStyle(
                    fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              Text(text2),

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
