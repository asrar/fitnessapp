import 'package:flutter/material.dart';

class Page20Duration extends StatelessWidget {
  final String title, time;
  Page20Duration({required this.title,required this.time});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}
